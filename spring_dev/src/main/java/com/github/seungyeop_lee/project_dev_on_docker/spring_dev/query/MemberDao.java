package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.query;

import com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain.Member;
import com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain.QMember;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MemberDao {
    private final JPAQueryFactory queryFactory;

    public Member findByName(String name) {
        return queryFactory.selectFrom(QMember.member)
                .where(QMember.member.name.eq(name))
                .fetchOne();
    }

    public List<Member> findAll() {
        return queryFactory.selectFrom(QMember.member)
                .fetch();
    }
}
