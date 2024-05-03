package com.prj1.service;

import com.prj1.domain.Member;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class MemberService {

    private final MemberMapper mapper;
    private final BCryptPasswordEncoder encoder;

    public void signup(Member member) {
        String password = member.getPassword();
        member.setPassword(encoder.encode(password));

        mapper.insert(member);
        log.info("member={}", member);
    }

    public List<Member> list() {
        List<Member> list = mapper.selectAll();
        log.info("service.list={}", list);
        return list;
    }

    public Member get(Integer id) {
        return mapper.selectById(id);
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }

    public int update(Member member) {
        return mapper.update(member);
    }

    public String emailCheck(String email) {
        Member member = mapper.selectByEmail(email);
        if (member == null) {
            // 사용 가능한 이메일
            return "사용가능한 이메일 입니다.";
        } else {
            // 이미 존재하는 이메일
            return "이미 존재하는 이메일입니다.";
        }
    }
}
