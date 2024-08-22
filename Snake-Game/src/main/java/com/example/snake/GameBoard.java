package com.example.snake;
public class GameBoard {
    private int width;
    private int height;
    private char[][] board;
    private Snake snake;
    private Food food;



    public GameBoard(int width, int height) {
        this.width = width;
        this.height = height;
        this.board = new char[height][width];


        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                board[i][j] =' ';
            }
        }
    }
    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }

    public void printBoard() {
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if (i == snake.getY() && j == snake.getX()) {
                    board[i][j] = 'S';
                } else if (i == food.getY() && j == food.getX()) {
                    board[i][j] = 'F';
                } else {
                    board[i][j] =' ';
                }
            }
        }

        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                System.out.print(board[i][j] + " ");
            }
            System.out.println();
        }
    }


    public Food getFood() {
        return food;
    }

    public Snake getSnake() {
        return snake;
    }

    public char[][] getBoard() {
        return board;
    }
    public void setWidth(int width) {
        this.width = width;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public void setBoard(char[][] board) {
        this.board = board;
    }

    public void setSnake(Snake snake) {
        this.snake = snake;
    }

    public void setFood(Food food) {
        this.food = food;
    }
}