package com.example.snake;

public class Snake {
    private final GameBoard gameBoard;
    private   int x;
    private   int y;

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    private Direction direction;

    public Snake(GameBoard gameBoard) {
        this.gameBoard = gameBoard;
        this.x = gameBoard.getWidth() / 2;
        this.y = gameBoard.getHeight() / 2;
        this.direction = Direction.RIGHT;
    }

    public void move() {
        switch (direction) {
            case UP:
                y--;
                break;
            case DOWN:
                y++;
                break;
            case LEFT:
                x--;
                break;
            case RIGHT:
                x++;
                break;
        }
        if (x < 0 || x >= gameBoard.getWidth() || y < 0 || y >= gameBoard.getHeight()) {
            System.out.println("Game Over!");
            System.exit(0);
        }
    }

    public boolean eatFood(Food food) {
        return x == food.getX() && y == food.getY();
    }

    public void setDirection(Direction direction) {
        this.direction = direction;
    }
}
