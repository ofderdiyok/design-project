package com.example.MarketApp.Recipify.ImageStorage;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "imagestorage")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ImageStorage {
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String type;

    @Lob
    @Column(name = "imagedata", length = 10000)
    private byte[] imageData;
}
