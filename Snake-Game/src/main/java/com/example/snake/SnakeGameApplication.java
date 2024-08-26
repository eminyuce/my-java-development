package com.example.snake;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.util.comparator.Comparators;

@SpringBootApplication
public class SnakeGameApplication {

    public static void main(String[] args) {
        // Start the Spring application and get the application context
        var context = SpringApplication.run(SnakeGameApplication.class, args);

        // Retrieve a bean from the application context by type
        TriangleService triangleService = context.getBean(TriangleService.class);


        triangleService.getAllTriangleTypes();

        // Use the bean
        triangleService.checkTriangleType();

        // extracted();
        System.exit(1);
    }

    private static void extracted() {
        //Input
        Scanner sc= new Scanner(System.in);
        int n=sc.nextInt();
        String []s=new String[n+2];
        for(int i=0;i<n;i++){
            s[i]=sc.next();
        }
        sc.close();

        String [] output = Arrays.stream(s).sorted(new Comparator<String>() {

            @Override
            public int compare(String a1, String a2) {
            	 if(a1 == null || a2 == null){
                     return -1;
                 }
                BigDecimal bigDec1 = new BigDecimal((String) a1);
                BigDecimal bigDec2 = new BigDecimal((String) a2);
                return bigDec2.compareTo(bigDec1);
            }

        }).toArray(String[]::new);

        s = output;

        //Output
        for(int i=0;i<n;i++)
        {
            System.out.println(s[i]);
        }
    }

    private static void extracted(String[] args) {
		SpringApplication.run(SnakeGameApplication.class, args);
        
        GameBoard gameBoard = new GameBoard(20, 20);
        Snake snake = new Snake(gameBoard);
        Food food = new Food(gameBoard);
        gameBoard.setSnake(snake);
        gameBoard.setFood(food);

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
	}

    @Bean
    public CommandLineRunner commandLineRunner() {
        return args -> {
            
        };
    }
}