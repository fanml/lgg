package com.example.ailin.repository;

import com.example.ailin.entity.TeamDetailInformation;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface TeamDetailInformationRepository extends CrudRepository<TeamDetailInformation, Integer>,
        JpaSpecificationExecutor<TeamDetailInformation> {

//    @Query(value =
//            "select new TeamDetailInformation(td.id,td.session) " +
//             "from TeamDetailInformation td " +
//                    "inner join  com.example.ailin.entity.Team t " +
//                    "on td.id=t.detailId " +
//                    "where " +
//                    "t.detailId=?1 and t.isDeleted=0 and td.champion=1 and td.isDeleted=0")
//    TeamDetailInformation findAllByTeamIdAndChampion(Integer teamId);

    @Query(nativeQuery = true, value = "select td.* from team_detail_information td inner join  team t on td.id=t.detail_id " +
            "where t.detail_id=?1 and t.is_deleted=0 and td.champion=1 and td.is_deleted=0")
    TeamDetailInformation findAllByTeamIdAndChampion(Integer teamId);

}
