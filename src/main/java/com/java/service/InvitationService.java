package com.java.service;

import com.java.pojo.Detail;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：黄子钧
 * date：2019/3/25 8:21
 */

public interface InvitationService {

    /**
     * 查询-分页
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Map<String, Object>> selectInvitation(Integer pageNum, Integer pageSize);



    /**
     * 查询标题
     * @param title
     * @return
     */

    List<Map<String, Object>> selectTitle(String title);





    /**
     * 查询回复
     * @return
     */
    List<Map<String, Object>> selectTz(Integer id);




    /**
     * 删除帖子
     * @param id
     * @return
     */

    boolean deleteInv(Integer id);



    /**
     * 新增
     * @param detail
     * @return
     */
    boolean insertInv(Detail detail);

}
