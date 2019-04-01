package com.java.mapper;

import com.java.pojo.Detail;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：黄子钧
 * date：2019/3/25 8:21
 */
public interface InvitationMapper {

    /**
     * 查询-分页
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Select("SELECT * FROM invitation")
    List<Map<String, Object>> selectInvitation(Integer pageNum, Integer pageSize);

    /**
     * 查询标题
     *
     * @param title
     * @return
     */
    @Select("SELECT * FROM `invitation` WHERE title  LIKE '%${title}%'")
    List<Map<String, Object>> selectTitle(@Param("title") String title);

    @Select("SELECT count(*) FROM `invitation` WHERE title  LIKE '%${title}%'")
    int countSelectTitle(@Param("title") String title);

    /**
     * 查询回复
     *
     * @return
     */
    @Select("SELECT * FROM `reply_detail` WHERE invid=#{0}")
    List<Map<String, Object>> selectTz(Integer id);

    /**
     * 新增
     * @param detail
     * @return
     */
    int insertInv(Detail detail);

    /**
     * 删除帖子
     * @param id
     * @return
     */
    @Delete("DELETE FROM `invitation` WHERE id =#{id}")
    int deleteInv(@Param("id") Integer id);

}
