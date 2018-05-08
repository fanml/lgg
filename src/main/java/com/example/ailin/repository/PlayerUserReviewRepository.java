package com.example.ailin.repository;

import com.example.ailin.entity.PlayerUserReview;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface PlayerUserReviewRepository extends CrudRepository<PlayerUserReview, Integer>,
        JpaSpecificationExecutor<PlayerUserReview> {
    @Query(nativeQuery = true,value = "SELECT AVG(a.grade) FROM player_user_review a WHERE  a.player_id=?1")
    java.math.BigDecimal getGradeAvg(int playerId);
}
