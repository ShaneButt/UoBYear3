import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

import java.util.ArrayList;
import java.util.List;

public class Snake
{
	SnakeGame gameContext;
	float speed; // snake movement speed
	private List<SnakePiece> pieces = new ArrayList<SnakePiece>(); // all snake pieces
	private int pieceSize;
	private Direction direction;
	
	public Snake(float speed, int x, int y, Direction dir, SnakeGame context)
	{
		this.speed = speed;
		pieces.add(new SnakePiece(x, y));
		pieces.add(new SnakePiece(x, y));
		pieces.add(new SnakePiece(x, y));
		this.direction = dir;
		this.gameContext = context;
		this.pieceSize = context.getPieceSize();
	}
	
	public boolean move()
	{
		for(int i = pieces.size()-1; i>= 1; i--)
		{
			pieces.get(i).x = pieces.get(i-1).x;
			pieces.get(i).y = pieces.get(i-1).y;
		}
		
		switch(direction)
		{
			case Up:
				pieces.get(0).y-=pieceSize;
				if(pieces.get(0).y<0)
					return false;
				break;
			case Left:
				pieces.get(0).x-=pieceSize;
				if(pieces.get(0).x < 0)
					return false;
				break;
			case Down:
				pieces.get(0).y+=pieceSize;
				if(pieces.get(0).y > gameContext.getHeight())
					return false;
				break;
			case Right:
				pieces.get(0).x+=pieceSize;
				if(pieces.get(0).x>gameContext.getWidth())
					return false;
				break;
		}
		return true;
	}
	
	public void eat()
	{
		pieces.add(new SnakePiece(-1, -1));
	}
	
	public void changeDirection(Direction dir)
	{
		this.direction = dir;
	}
	
	public boolean canEatFood(Food food)
	{
		for(SnakePiece s : pieces)
		{
			if(s.x == food.x && s.y == food.y)
			{
				return true;
			}
		}
		return false;
	}
	
	public boolean selfDestroyCheck()
	{
		for(int i = 1; i < pieces.size(); i++)
		{
			if(pieces.get(0).x == pieces.get(i).x && pieces.get(0).y == pieces.get(i).y)
			{
				return true;
			}
		}
		return false;
	}
	
	public void draw(GraphicsContext context)
	{
		for(SnakePiece s: pieces)
		{
			context.setFill(Color.GREEN);
			context.fillRect(s.x, s.y, pieceSize, pieceSize);
		}
	}
	
	public Direction getDirection()
	{
		return direction;
	}
	
	public int size()
	{
		return pieces.size();
	}
}
