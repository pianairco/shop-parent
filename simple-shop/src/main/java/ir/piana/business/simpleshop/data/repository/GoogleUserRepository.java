package ir.piana.business.simpleshop.data.repository;

import ir.piana.business.simpleshop.data.model.GoogleUserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GoogleUserRepository extends JpaRepository<GoogleUserEntity, Long> {
    GoogleUserEntity findByUsername(String email);
}
