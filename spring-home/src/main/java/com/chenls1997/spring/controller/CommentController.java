package com.chenls1997.spring.controller;

import com.chenls1997.spring.service.CommentService;
import com.chenls1997.spring.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Chenls on 16/12/22.
 */

@Controller
@RequestMapping("comment")
public class CommentController extends BaseController {
    private final CommentService commentService;
    private final GoodService goodService;

    @Autowired
    public CommentController(HttpSession httpSession, CommentService commentService, GoodService goodService) {
        super(httpSession);
        this.commentService = commentService;
        this.goodService = goodService;
    }

    @RequestMapping("do")
    public String doHandler(Model model, HttpServletRequest request, HttpServletResponse response,
                            @RequestParam("content") String content,
                            @ModelAttribute("userId") Integer userIdd) {
        return ajaxReturn(response, null);
    }
}