package com.example.spring_dockerhub_docker;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface PhoneRepo extends JpaRepository<Phone, Long>{}
