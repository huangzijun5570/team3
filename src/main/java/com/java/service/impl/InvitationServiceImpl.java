package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.InvitationMapper;
import com.java.pojo.Detail;
import com.java.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：黄子钧
 * date：2019/3/25 8:25
 */

@Service
public class InvitationServiceImpl implements InvitationService {
    @Autowired
    private InvitationMapper invitationMapper;

    /**
     * 查询-分页
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    public List<Map<String, Object>> selectInvitation(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return invitationMapper.selectInvitation(pageNum,pageSize);
    }
    /**
     * 查询标题
     * @param title
     * @return
     */
    @Override
    public List<Map<String, Object>> selectTitle(String title) {
        return invitationMapper.selectTitle(title);
    }



    /**
     * 查询回复
     * @return
     */
    @Override
    public List<Map<String, Object>> selectTz(Integer id) {
        return invitationMapper.selectTz(id);
    }


    /**
     * 删除帖子
     * @param id
     * @return
     */
    @Override
    public boolean deleteInv(Integer id) {
        return invitationMapper.deleteInv(id)>=1;
    }

    /**
     * 新增
     * @param detail
     * @return
     */
    @Override
    public boolean insertInv(Detail detail) {
        return invitationMapper.insertInv(detail)>=1;
    }
}
