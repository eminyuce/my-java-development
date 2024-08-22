package com.example.snake;


public class Food {
    private GameBoard gameBoard;
    private int x;
    private int y;

    public Food(GameBoard gameBoard) {
        this.gameBoard = gameBoard;
        generateNewFood();
    }

    public void generateNewFood() {
        x = (int) (Math.random() * gameBoard.getWidth());
        y = (int) (Math.random() * gameBoard.getHeight());
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }
}