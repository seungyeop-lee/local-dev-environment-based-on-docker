package com.github.seungyeop_lee.project_dev_on_docker.spring_dev.controller;

import com.github.seungyeop_lee.project_dev_on_docker.spring_dev.command.MemberService;
import com.github.seungyeop_lee.project_dev_on_docker.spring_dev.domain.Member;
import com.github.seungyeop_lee.project_dev_on_docker.spring_dev.query.MemberDao;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;
    private final MemberDao memberDao;

    @GetMapping("/{name}")
    public Member get(@PathVariable String name) {
        return memberDao.findByName(name);
    }

    @GetMapping("")
    public List<Member> getAll() {
        return memberDao.findAll();
    }

    @PostMapping("/{name}")
    public ResponseEntity<?> save(@PathVariable String name) {
        memberService.saveMember(name);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
