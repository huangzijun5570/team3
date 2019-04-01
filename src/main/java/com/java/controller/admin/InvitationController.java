package com.java.controller.admin;

import com.github.pagehelper.PageInfo;
import com.java.pojo.Detail;
import com.java.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * description：
 * author：黄子钧
 * date：2019/3/25 8:25
 */

@Controller
@RequestMapping("/inv")
public class InvitationController {
    @Autowired
    private InvitationService invitationService;

    /**
     * 查询-分页
     * @param
     * @param
     * @return
     */
    @RequestMapping("/selectInvitation")
    public String selectInvitation(@RequestParam(defaultValue = "1") Integer pageNum,
                                                      @RequestParam(defaultValue = "4") Integer pageSize,
                                                      Model model) {
        List<Map<String, Object>> mapList = invitationService.selectInvitation(pageNum, pageSize);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(mapList);
        model.addAttribute("pageInfo", pageInfo);
       /* Map<String, Object> hashMap = new HashMap<>();
        hashMap.put("total", pageInfo.getTotal());
        hashMap.put("list", pageInfo.getList());*/
        return "admin/InvList.jsp";
    }



    /**
     * 查询标题
     * @param title
     * @return
     */
    @RequestMapping("/selectTitle")
    @ResponseBody
    public List<Map<String, Object>> selectTitle(String title) {
        return invitationService.selectTitle(title);
    }




    /**
     * 查询回复
     * @return
     */
    @RequestMapping("/selectTz")
    public String selectTz(Integer id,Model model) {
        List<Map<String, Object>> maps = invitationService.selectTz(id);
        model.addAttribute("list", maps);
        return "admin/selectTz.jsp";
    }



    /**
     * 删除帖子
     * @param id
     * @return
     */
    @RequestMapping("/deleteInv")
    @ResponseBody
    public boolean deleteInv(Integer id) {
        return invitationService.deleteInv(id);
    }



    /**
     * 新增
     * @param detail
     * @return
     */
    @RequestMapping("/insertInv")
    @ResponseBody
    public boolean insertInv(@RequestBody Detail detail) {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String format1 = format.format(new Date());
        detail.setCreatedate(format1);
        System.out.println(detail.toString());
        return invitationService.insertInv(detail);
    }

}
