package com.prj1.service;

import com.prj1.domain.Board;
import com.prj1.domain.CustomUser;
import com.prj1.domain.Member;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            board.setMemberId(member.getId());
        }
        mapper.insert(board);
    }

    public Board getBoard(Integer id) {
        return mapper.selectById(id);
    }

    public List<Board> list() {
        return mapper.selectByAll();
    }

    public Map<String, Object> list(Integer page) {
        int offset = (page - 1) * 10;
        int lastNumOfBoard = mapper.countAll();
        int lastPageNumber = (lastNumOfBoard - 1) / 10 + 1;
        int endPageNumber = (page - 1) / 10 * 10 + 10;
        endPageNumber = Math.min(endPageNumber, lastPageNumber);
        int beginPageNumber = endPageNumber - 9;
        int prevPageNumber = beginPageNumber - 10;
        int nextPageNumber = beginPageNumber + 10;

        return Map.of("boardList", mapper.selectByAllByPage(offset),
                "pageInfo", Map.of("lastPageNumber", lastPageNumber,
                        "endPageNumber", endPageNumber,
                        "beginPageNumber", beginPageNumber,
                        "prevPageNumber", prevPageNumber,
                        "nextPageNumber", nextPageNumber,
                        "currentPageNumber", page));
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }

    public void update(Board board) {
        mapper.updateById(board);
    }

    public boolean hasAccess(Integer id, Authentication authentication) {
        if (authentication == null) {
            return false;
        }

        Board board = mapper.selectById(id);

        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            return board.getMemberId().equals(member.getId());
        }
        return false;
    }
}
