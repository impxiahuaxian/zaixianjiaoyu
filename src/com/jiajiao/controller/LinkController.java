package com.jiajiao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiajiao.bean.Link;
import com.jiajiao.service.LinkService;

@Controller
@RequestMapping("link")
public class LinkController {

	@Resource
	private LinkService linkService;

	@RequestMapping("pubLinkInfo")
	@ResponseBody
	public Map<String, Object> pubLinkInfo(Link link) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = linkService.pubLinkInfo(link);
		if (row == 0) {

			map.put("success", false);
			map.put("message", "提交失败，请重新提交或联系管理员。");
		} else {
			map.put("success", true);
			map.put("message", "提交成功，等待管理员确认！");
		}
		return map;
	}

	@RequestMapping("linkList")
	public ModelAndView linkList() {
		ModelAndView modelAndView = new ModelAndView();

		List<Link> linkList = linkService.findAllLink();

		modelAndView.addObject("linkList", linkList);
		modelAndView.setViewName("admin/linkList");

		return modelAndView;
	}

	@RequestMapping("displayLink")
	@ResponseBody
	public Map<String, Object> displayLink(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = linkService.changeDisplay(id, 1);
		if (row != 0) {
			map.put("success", true);

		} else {
			map.put("success", false);
		}

		return map;
	}

	@RequestMapping("noDisplayLink")
	@ResponseBody
	public Map<String, Object> noDisplayLink(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = 0;
		row = linkService.changeDisplay(id, 0);
		if (row != 0) {
			map.put("success", true);

		} else {
			map.put("success", false);
		}

		return map;
	}

	@RequestMapping("linkInfo")
	@ResponseBody
	public Map<String, Object> linkInfo(int id) {

		Map<String, Object> map = new HashMap<String, Object>();

		Link link = null;

		link = linkService.findByLid(id);
		if (link != null) {
			map.put("success", true);
			map.put("message", link);
		} else {
			map.put("success", false);
			map.put("message", "查询失败");
		}

		return map;

	}

	@RequestMapping("updateLinkInfo")
	@ResponseBody
	public Map<String, Object> updateLinkInfo(Link link) {

		Map<String, Object> map = new HashMap<String, Object>();
		int row = linkService.updateLinkInfo(link);

		if (row == 0) {
			map.put("success", false);
			map.put("message", "操作失败");

		} else {
			map.put("success", true);
			map.put("message", "操作成功");
		}

		return map;

	}
}
