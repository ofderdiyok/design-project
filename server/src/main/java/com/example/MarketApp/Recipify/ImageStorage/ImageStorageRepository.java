package com.example.MarketApp.Recipify.ImageStorage;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ImageStorageRepository extends JpaRepository<ImageStorage, Long> {
    Optional<ImageStorage> findByName(String fileName);
}
