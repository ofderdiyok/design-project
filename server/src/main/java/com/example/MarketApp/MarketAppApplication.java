package com.example.MarketApp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class MarketAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(MarketAppApplication.class, args);
		System.out.println("System started successfully");
	}
	/* 
	@Bean
    public CommandLineRunner importCsvData() {
        return args -> {
            // Specify the path to your CSV file
            String csvFilePath = "src\\main\\java\\com\\example\\MarketApp\\recipes.csv";
            
            // Import CSV data
            try (BufferedReader br = new BufferedReader(new FileReader(csvFilePath))) {
                String line;
				int count=0;
                while ((line = br.readLine()) != null) {
                    // Process each line of the CSV file
                	count++;
					
					//element indexes needed are 0,1,6,9,13,16,27

					//bu indexlerdeki elemanları çekerek Recipe objesi oluştur ve Controllerdaki addRecipe methodunu kullanarak database e ekle
					if(count==2){
						System.out.println("all line is:"+line);
						String[] list= line.split(",");  // Replace this with your processing logic
						System.out.println("split count:"+list.length);
						for(int i=0;i<list.length;i++){
							System.out.println(i+" is:"+list[i]);
						}
						/* 
						for(int i=0;i<list.length;i++){
							
							if(i==0){
								System.out.println("id is:"+list[i]);
							}
							if(i==1){
								System.out.println("name is:"+list[i]);
							}
							if(i==6){
								System.out.println("totaltime is:"+list[i]);
							}
							if(i==9){
								System.out.println("images is:"+list[i]);
							}
							if(i==13){
								System.out.println("ingredients is:"+list[i]);
							}
							if(i==16){
								System.out.println("calories is:"+list[i]);
							}
							if(i==27){
								System.out.println("instruction is:"+list[i]);
							}
							
						}
						
						break;
					}
					
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        };
    }
	*/
	

}
