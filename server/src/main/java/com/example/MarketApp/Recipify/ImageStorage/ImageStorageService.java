package com.example.MarketApp.Recipify.ImageStorage;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.Optional;

@Service
public class ImageStorageService {
    private final ImageStorageRepository imageStorageRepository;

    public ImageStorageService(ImageStorageRepository imageStorageRepository) {
        this.imageStorageRepository = imageStorageRepository;
    }

    public String uploadImage(MultipartFile file) throws IOException{
        int unique_id= (int) ((new Date().getTime() / 1000L) % Integer.MAX_VALUE);
        ImageStorage imageStorage = imageStorageRepository.save(ImageStorage.builder()
                                        .name(Integer.toString(unique_id))
                                        .type(file.getContentType())
                                        .imageData(ImageStorageUtils.compressImage(file.getBytes())).build());
        if (imageStorage != null){
            return "file uploaded succesfully";
        }

        return null;
    }

    public byte[] downloadImage(Long id){
        Optional<ImageStorage> dbImageData = imageStorageRepository.findById(id);
        byte[] images = ImageStorageUtils.decompressImage(dbImageData.get().getImageData());
        return images;
    }
}
