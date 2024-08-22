package com.example.snake;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SnakeGameApplication {

    public static void main(String[] args) {
        SpringApplication.run(SnakeGameApplication.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner() {
        return args -> {
            GameBoard gameBoard = new GameBoard(20, 20);
            Snake snake = new Snake(gameBoard);
            Food food = new Food(gameBoard);

            while (true) {
                gameBoard.printBoard();
                snake.move();
                if (snake.eatFood(food)) {
                    food.generateNewFood();
                }
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
        };
    }
}