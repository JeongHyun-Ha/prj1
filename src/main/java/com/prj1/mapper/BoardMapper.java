package com.prj1.mapper;

import com.prj1.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            INSERT INTO board (title, content, member_id)
            VALUES (#{title}, #{content}, #{memberId})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Board board);

    @Select("""
            SELECT b.id, title, content, m.nick_name writer, member_id, b.inserted
            FROM board b JOIN member m ON b.member_id = m.id
            WHERE b.id = #{id}
            """)
    Board selectById(Integer id);

    @Select("""
            SELECT *
            FROM board
            ORDER BY id DESC
            """)
    List<Board> selectByAll();

    @Delete("""
            DELETE FROM board
            WHERE id = #{id}
            """)
    int deleteById(Integer id);

    @Update("""
            UPDATE board
            SET title = #{title},
                content = #{content}
            WHERE id = #{id}
            """)
    int updateById(Board board);

    @Select("""
            SELECT b.id, title, content, m.nick_name writer, member_id, b.inserted
            FROM board b JOIN member m ON b.member_id = m.id
            ORDER BY b.id DESC
            LIMIT #{offset}, 10
            """)
    List<Board> selectByAllByPage(int offset);

    @Select("SELECT COUNT(*) FROM board")
    int countAll();
}
