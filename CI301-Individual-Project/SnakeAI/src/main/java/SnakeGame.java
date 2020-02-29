import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;

import java.util.Random;

public class SnakeGame extends Application
{
	static boolean gameOver;
	static Snake snake;
	static int snakePieceSize = 25;
	static int gameSize = 40;
	static int height = gameSize * snakePieceSize;
	static int width = gameSize * snakePieceSize;
	static Food food;
	static Random rand = new Random();
	
	public static void main(String[] args)
	{
		launch(args);
	}
	
	@Override
	public void start(Stage primaryStage)
	{
		try {
			snake = new Snake(5, width/2, height/2, Direction.Up, this);
			foodControl();
			
			VBox root = new VBox();
			Canvas canvas = new Canvas(width, height);
			GraphicsContext context = canvas.getGraphicsContext2D();
			root.getChildren().add(canvas);
			
			new AnimationTimer() {
				long last = 0;
				
				public void handle(long now)
				{
					if (last == 0)
					{
						last = now;
						tick(context);
						return;
					}
					
					if(now - last > 1000000000 / snake.speed)
					{
						last = now;
						tick(context);
					}
				}
			}.start();
			
			Scene scene = new Scene(root, width, height);
			
			// game controls
			scene.addEventFilter(KeyEvent.KEY_PRESSED,  key -> {
				if((snake.getDirection()!=Direction.Down) && (key.getCode()==KeyCode.W || key.getCode()==KeyCode.UP))
					snake.changeDirection(Direction.Up);
				
				if((snake.getDirection()!=Direction.Right) && (key.getCode()==KeyCode.A || key.getCode()==KeyCode.LEFT))
					snake.changeDirection(Direction.Left);
				
				if((snake.getDirection()!=Direction.Up) && (key.getCode()==KeyCode.S || key.getCode()==KeyCode.DOWN))
					snake.changeDirection(Direction.Down);
				
				if((snake.getDirection()!=Direction.Left) && (key.getCode()==KeyCode.D || key.getCode()==KeyCode.RIGHT))
					snake.changeDirection(Direction.Right);
			});
			
			// create the snake
			
			primaryStage.setScene(scene);
			primaryStage.setTitle("AI Snake Game");
			primaryStage.show();
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void tick(GraphicsContext context)
	{
		if(gameOver)
		{
			context.setFill(Color.RED);
			context.setFont(new Font("", 50));
			context.fillText("GAME OVER", width/2.0 - 125,  height/2.0 - 50);
			return;
		}
		
		boolean isDead = !snake.move();
		if(snake.canEatFood(food))
		{
			snake.eat();
			foodControl();
		}
		
		boolean didCollide = snake.selfDestroyCheck();
		gameOver = isDead || didCollide;
		
		// background
		context.setFill(Color.BLACK);
		context.fillRect(0, 0, width, height);
		
		// score
		context.setFill(Color.WHITE);
		context.setFont(new Font("Score", 30));
		context.fillText("Score: " + (snake.speed-6), 10, 30);
		
		//food
		context.setFill(Color.RED);
		context.fillOval(food.x, food.y, snakePieceSize, snakePieceSize);
		
		//snake
		snake.draw(context);
	}
	
	public static void foodControl()
	{
		while(true)
		{
			int x = rand.nextInt(gameSize)*snakePieceSize;
			int y = rand.nextInt(gameSize)*snakePieceSize;
			food = new Food(x, y);
			if(snake.canEatFood(food))
			{
				continue;
			}
			snake.speed+=1;
			break;
		}
	}
	
	public int getWidth()
	{
		return width;
	}
	
	public int getHeight()
	{
		return height;
	}
	
	public int getPieceSize()
	{
		return snakePieceSize;
	}
}

