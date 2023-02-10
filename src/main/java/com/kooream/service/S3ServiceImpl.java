package com.kooream.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Date;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.HttpMethod;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.util.IOUtils;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@Service
@RequiredArgsConstructor
@Configuration
@PropertySource("classpath:properties/awss3.properties")
public class S3ServiceImpl implements S3Service{
	private AmazonS3 s3Client;
	
	@Value("${bucketName}")
	private String bucketName;
	@Value("${accessKey}")
	private String accessKey;
	@Value("${secretKey}")
	private String secretKey;
	
//	public S3ServiceImpl() {
//		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
//		
//		this.s3Client = AmazonS3ClientBuilder.standard()
//				.withCredentials(new AWSStaticCredentialsProvider(credentials))
//				.withRegion(Regions.AP_NORTHEAST_1)
//				.build();
//	}
	
//	public void uploadFile(MultipartFile[] imageList, String s3Path) {
//		for (MultipartFile image : imageList) {
//			uploadAWS(image, s3Path);
//		}
//	}
	public void init() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		
		this.s3Client = AmazonS3ClientBuilder.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(Regions.AP_NORTHEAST_1)
				.build();
	}
	
	public void uploadAWS(MultipartFile image, String s3Path) {
		if (this.s3Client == null) init();
		
		try {
			byte[] bytes = IOUtils.toByteArray(image.getInputStream());
			
			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentLength(bytes.length);
			objectMetadata.setContentType(image.getContentType());
			
			ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
			this.s3Client.putObject(this.bucketName, s3Path.replace(File.separatorChar, '/'), byteArrayInputStream, objectMetadata);
			
			byteArrayInputStream.close();
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@Override
	public void uploadThumbFile(MultipartFile image, String s3Path, int width, int height) {
		try {
			BufferedImage bufferImage = ImageIO.read(image.getInputStream());
			BufferedImage thumbnailImage = Thumbnails.of(bufferImage).size(280, 350).asBufferedImage();
			
	        ByteArrayOutputStream thumbOutput = new ByteArrayOutputStream();
	        String imageType = image.getContentType();
	        ImageIO.write(thumbnailImage, imageType.substring(imageType.indexOf("/")+1), thumbOutput);

	        ObjectMetadata thumbObjectMetadata = new ObjectMetadata();
	        byte[] thumbBytes = thumbOutput.toByteArray();
	        thumbObjectMetadata.setContentLength(thumbBytes.length);
	        thumbObjectMetadata.setContentType(image.getContentType());

	        InputStream thumbInput = new ByteArrayInputStream(thumbBytes);
	        this.s3Client.putObject(this.bucketName, s3Path.replace(File.separatorChar, '/'), thumbInput, thumbObjectMetadata);
		
	        thumbInput.close();
	        thumbOutput.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public String getFileURL(String fileName) {
		if (s3Client == null) init();
		
		Date expiration = new Date();
		long expTimeMillis = expiration.getTime();
		expTimeMillis += 1000 * 60 * 60; // 1 hour
		expiration.setTime(expTimeMillis);
		
		GeneratePresignedUrlRequest generatePresignedUrlRequest =
		  	new GeneratePresignedUrlRequest(bucketName, (fileName).replace(File.separatorChar, '/'))
		      .withMethod(HttpMethod.GET)
		      .withExpiration(expiration);

		return s3Client.generatePresignedUrl(generatePresignedUrlRequest).toString();
	}
}
