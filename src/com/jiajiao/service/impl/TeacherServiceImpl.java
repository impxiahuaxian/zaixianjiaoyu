package com.jiajiao.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.jiajiao.bean.Teacher;
import com.jiajiao.dao.TeacherDao;
import com.jiajiao.service.TeacherService;

@Service("teacherService")
@Transactional
public class TeacherServiceImpl implements TeacherService {

	@Resource
	private TeacherDao teacherDao;

	@Override
	public List<Teacher> findTeacherListIsZhongXiaoXue(int isMobile) {

		return teacherDao.findTeacherListIsZhongXiaoXue(isMobile);
	}

	@Override
	public List<Teacher> findTeacherListIsYueQi(int isMobile) {
		return teacherDao.findTeacherListIsYueQi(isMobile);
	}

	@Override
	public List<Teacher> findTeacherListIsQiLei(int isMobile) {
		return teacherDao.findTeacherListIsQiLei(isMobile);
	}

	@Override
	public Map<String, Object> registTeacher(String phone, String pwd) {

		Map<String, Object> map = new HashMap<String, Object>();

		Teacher teacher = teacherDao.findByPhone(phone);

		if (teacher != null) {// 已经存在该手机号
			map.put("success", false);
			map.put("message", "手机号已存在");
			return map;
		} else {

			int row = teacherDao.insertByPhoneAndPwd(phone, pwd);
			if (row != 0) {
				map.put("success", true);
				map.put("message", "注册成功！");
				return map;
			} else {
				map.put("success", false);
				map.put("message", "注册失败！");
				return map;
			}
		}

	}

	@Override
	public Teacher findByPhone(String phone) {
		return teacherDao.findByPhone(phone);
	}

	@Override
	public Teacher login(String phone, String pwd) {

		Teacher teacher = teacherDao.findByPhoneAndPwd(phone, pwd);

		if (teacher != null && teacher.getIsUse() == 1) {

			// 更新该教员最近登录时间
			teacherDao.updateLastLoginTimeByPhone(phone);

			return teacher;
		} else if (teacher != null && teacher.getIsUse() == 0) {
			return teacher;
		} else {
			return null;
		}

	}

	@Override
	public Map<String, Object> updateTeacher(Teacher teacher) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = teacherDao.updateTeacher(teacher);
		if (row != 0) {
			map.put("success", true);
			map.put("message", "信息修改成功");

			return map;
		} else {
			map.put("success", false);
			map.put("message", "信息修改失败");
			return map;
		}

	}

	@Override
	public Map<String, Object> changePwd(String pwd, int teacherId) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = teacherDao.changePwdByTeacherId(pwd, teacherId);

		if (row != 0) {
			map.put("success", true);
			map.put("message", "密码修改成功");

			return map;
		} else {
			map.put("success", false);
			map.put("message", "密码修改失败");
			return map;
		}
	}

	@Override
	public Map<String, Object> uploadPersonImg(MultipartFile file,
			HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		String path = null;// 文件路径
		String type = null;// 文件类型

		// 项目在容器中实际发布运行的根路径
		String realPath = request.getSession().getServletContext().getRealPath(
				"/");

		Map<String, Object> map = new HashMap<String, Object>();

		Teacher teacher = (Teacher) session.getAttribute("teacher");

		if (teacher != null) {

			// 尝试删除原先图片
			// String preImg = teacher.getPersonImg();
			// 设置存放图片文件的路径
			// path = realPath + "static/teacherimg/personphoto/" + preImg;
			// new File(path).delete();

			if (file != null) {// 判断上传的文件是否为空

				long size = file.getSize();

				if (size > 10000000) {
					map.put("success", false);
					map.put("message", "文件超出大小！");
					return map;
				}

				String fileName = file.getOriginalFilename();// 文件原名称
				// 判断文件类型
				type = fileName.indexOf(".") != -1 ? fileName.substring(
						fileName.lastIndexOf(".") + 1, fileName.length())
						: null;

				if (type != null) {// 判断文件类型是否为空
					if ("GIF".equals(type.toUpperCase())
							|| "PNG".equals(type.toUpperCase())
							|| "JPG".equals(type.toUpperCase())) {

						// System.out.println("项目在容器中实际发布运行的根路径" + realPath);

						// 自定义的文件名称
						String trueFileName = String.valueOf(System
								.currentTimeMillis())
								+ fileName;

						if (trueFileName.length() > 150) {// 文件名称太长

							trueFileName = trueFileName.substring(0, 13)
									+ trueFileName.substring(trueFileName
											.length() - 10, trueFileName
											.length());
						}

						/* System.getProperty("file.separator")+ */
						// 设置存放图片文件的路径
						path = realPath + "static/teacherimg/personphoto/"
								+ trueFileName;

						// 转存文件到指定的路径
						file.transferTo(new File(path));

						int row = teacherDao.updatePersonImg(trueFileName,
								teacher.getTeacherId());
						if (row != 0) {

							// 尝试删除原先图片
							String preImg = teacher.getPersonImg();
							// 设置存放图片文件的路径
							path = realPath + "static/teacherimg/personphoto/"
									+ preImg;
							new File(path).delete();

							teacher.setPersonImg(trueFileName);
							session.setAttribute("teacher", teacher);
							map.put("success", true);
							map.put("message", "上传成功！");
							map.put("url", "../static/teacherimg/personphoto/"
									+ trueFileName);

						} else {
							new File(path).delete();
							map.put("success", false);
							map.put("message", "上传失败！");
						}
						return map;
					} else {
						map.put("success", false);
						map.put("message", "文件类型非图片格式");
						return map;
					}
				} else {
					map.put("success", false);
					map.put("message", "文件类型为空");
					return map;
				}
			} else {
				map.put("success", false);
				map.put("message", "没有找到相对应的文件");
				return map;
			}
		} else {
			map.put("success", false);
			map.put("message", "您已退出登录");
			return map;
		}

	}

	@Override
	public int PagefindAllTeacherListCout() {

		return teacherDao.PagefindAllTeacherListCout();
	}

	@Override
	public List<Teacher> PagefindAllTeachersList(int pageSize, int currentPage) {

		return teacherDao.PagefindAllTeachersList(pageSize, currentPage);
	}

	@Override
	public Teacher findByTeacherId(int tId) {
		return teacherDao.findByTeacherId(tId);
	}

	@Override
	public List<Teacher> findAllTeacherList() {

		return teacherDao.findAllTeacherList();
	}

	@Override
	public int changeTeacherUse(int id, int i) {
		return teacherDao.changeTeacherUse(id, i);
	}

	@Override
	public int auditTeacher(int id, int i) {

		return teacherDao.changeTeacherCheck(id, i);
	}

	@Override
	public int pageFindTeacherListCount(String course, String areaId,
			int teacherType, int gender) {

		return teacherDao.pageFindTeacherListCount(course, areaId, teacherType,
				gender);
	}

	@Override
	public List<Teacher> PagefindTeachersList(String course, String areaId,
			int teacherType, int gender, int pageSize, int currentPage) {
		return teacherDao.PagefindTeachersList(course, areaId, teacherType,
				gender, pageSize, currentPage);
	}

	@Override
	public Map<String, Object> PersonIDUpload(HttpServletRequest request,
			HttpSession session) throws IllegalStateException, IOException {

		Map<String, Object> map = new HashMap<String, Object>();

		Teacher teacher = (Teacher) session.getAttribute("teacher");

		if (teacher == null) {
			map.put("message", "您已退出登录！");
			return map;
		}

		String path = null;// 文件路径
		String type = null;// 文件类型

		// 项目在容器中实际发布运行的根路径
		String realPath = request.getSession().getServletContext().getRealPath(
				"/");

		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {

			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

			// 获取multiRequest 中所有的文件名
			Iterator<String> iter = multiRequest.getFileNames();

			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {

					long size = file.getSize();

					if (size > 5000000) {
						map.put("message", "文件大小超出限制！限5M以内。");
						return map;
					}

					String fileName = file.getOriginalFilename();// 文件原名称

					// 判断文件类型
					type = fileName.indexOf(".") != -1 ? fileName.substring(
							fileName.lastIndexOf(".") + 1, fileName.length())
							: null;

					if (type != null) {// 判断文件类型是否为空

						if ("GIF".equals(type.toUpperCase())
								|| "PNG".equals(type.toUpperCase())
								|| "JPG".equals(type.toUpperCase())
								|| "JPEG".equals(type.toUpperCase())) {

							// 自定义的文件名称
							String trueFileName = String.valueOf(System
									.currentTimeMillis())
									+ fileName;

							if (trueFileName.length() > 150) {// 文件名称太长

								trueFileName = trueFileName.substring(0, 13)
										+ trueFileName.substring(trueFileName
												.length() - 10, trueFileName
												.length());
							}

							/* System.getProperty("file.separator")+ */
							// 设置存放图片文件的路径
							path = realPath + "static/teacherimg/idimg/"
									+ trueFileName;

							// 转存文件到指定的路径
							file.transferTo(new File(path));

							int row = teacherDao.updateIDImg(trueFileName,
									teacher.getTeacherId());
							if (row != 0) {

								// 尝试删除原先图片
								String preImg = teacher.getIdPhoto();
								// 设置存放图片文件的路径
								path = realPath + "static/teacherimg/idimg/"
										+ preImg;
								new File(path).delete();

								teacher.setIdPhoto(trueFileName);
								session.setAttribute("teacher", teacher);
								map.put("success", true);
								map
										.put("message",
												"身份证上传成功！请等待审核。咨询客服微信，加快审核。");
								map.put("url", "../static/teacherimg/idimg/"
										+ trueFileName);

							} else {
								new File(path).delete();
								map.put("success", false);
								map.put("message", "上传失败！");
							}
							return map;

						} else {
							map.put("success", false);
							map.put("message", "上传失败，文件类型非图片格式");
							return map;
						}

					} else {
						map.put("success", false);
						map.put("message", "上传失败，文件类型为空!");
						return map;
					}
				} else {
					map.put("success", false);
					map.put("message", "没有找到相对应的文件");
					return map;
				}
			}
		}
		return map;

	}

	@Override
	public int countTeacherTotal() {
		return teacherDao.countTeacherTotal();
	}

	@Override
	public int calSuccessJJ(int tId) {
		return teacherDao.calSuccessJJ(tId);
	}

	@Override
	public int countBanTeacherTotal() {
		return teacherDao.countBanTeacherTotal();
	}

	@Override
	public int countPendingTeacherTotal() {
		return teacherDao.countPendingTeacherTotal();
	}

	@Override
	public List<Teacher> pagefindTeachersListByCondition(String course,
			String area, int teacherType, int gender, int pageSize,
			Integer pageNo) {

		return teacherDao.pagefindTeachersListByCondition(course, area,
				teacherType, gender, pageSize, pageNo);
	}

	@Override
	public Map<String, Object> registTeacher(String mobile, String pwd,
			String teacherType) {
		Map<String, Object> map = new HashMap<String, Object>();

		Teacher teacher = teacherDao.findByPhone(mobile);

		if (teacher != null) {// 已经存在该手机号
			map.put("success", false);
			map.put("message", "手机号已存在");
			return map;
		} else {

			int row = teacherDao.insertByPhoneAndPwd(mobile, pwd, teacherType);
			if (row != 0) {
				map.put("success", true);
				map.put("message", "注册成功！");
				map.put("redirect", "mLoginPage.action");
				return map;
			} else {
				map.put("success", false);
				map.put("message", "注册失败！");
				return map;
			}
		}
	}

	@Override
	public Map<String, Object> mUpdatePersonal(Teacher teacher,
			HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		int row = teacherDao.mUpdatePersonal(teacher);
		if (row != 0) {

			teacher = teacherDao.findByTeacherId(teacher.getTeacherId());
			session.setAttribute("teacher", teacher);

			map.put("success", true);
			map.put("message", "修改成功！");
		} else {
			map.put("success", false);
			map.put("message", "修改失败！");
		}

		return map;
	}

	@Override
	public Map<String, Object> mUpdateEducate(Teacher teacher,
			HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		int row = teacherDao.mUpdateEducate(teacher);
		if (row != 0) {

			teacher = teacherDao.findByTeacherId(teacher.getTeacherId());
			session.setAttribute("teacher", teacher);

			map.put("success", true);
			map.put("message", "修改成功！");
		} else {
			map.put("success", false);
			map.put("message", "修改失败！");
		}

		return map;
	}
	
	@Override
	public Map<String, Object> mUpdateTeaching(Teacher teacher,
			HttpSession session) {


		Map<String, Object> map = new HashMap<String, Object>();

		int row = teacherDao.mUpdateTeaching(teacher);
		if (row != 0) {

			teacher = teacherDao.findByTeacherId(teacher.getTeacherId());
			session.setAttribute("teacher", teacher);

			map.put("success", true);
			map.put("message", "修改成功！");
		} else {
			map.put("success", false);
			map.put("message", "修改失败！");
		}

		return map;
		
	}
}
