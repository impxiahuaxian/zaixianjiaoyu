package com.jiajiao.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.jiajiao.bean.Institution;
import com.jiajiao.dao.InstitutionDao;
import com.jiajiao.service.InstitutionService;

@Service("institutionService")
@Transactional
public class InstitutionServiceImpl implements InstitutionService {

	@Resource
	private InstitutionDao institutionDao;

	@Override
	public List<Institution> findAll(int display) {
		return institutionDao.findAll(display);
	}

	@Override
	public Institution findByIid(int iId) {
		return institutionDao.findByIid(iId);
	}

	@Override
	public List<Institution> findTopThreeInstitution() {
		return institutionDao.findTopThreeInstitution();
	}

	@Override
	public int addViewNum(int iId) {
		return institutionDao.addViewNum(iId);
	}

	@Override
	public int stopInstitution(int iId) {
		return institutionDao.updateInstitutionDisPlay(iId, -1);
	}

	@Override
	public int startInstitution(int iId) {
		return institutionDao.updateInstitutionDisPlay(iId, 1);
	}

	@Override
	public Map<String, Object> updateInstitution(HttpServletRequest request)
			throws IllegalStateException, IOException {

		Map<String, Object> map = new HashMap<String, Object>();

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

			Institution institution = new Institution();
			institution.setiId(Integer.parseInt((multiRequest
					.getParameter("iId"))));
			institution.setiName(multiRequest.getParameter("iName"));
			institution.setKemudalei(multiRequest.getParameter("kemudalei"));
			institution.setCourse(multiRequest.getParameter("course"));
			institution
					.setContactName(multiRequest.getParameter("contactName"));
			institution.setContactPhone(multiRequest
					.getParameter("contactPhone"));
			institution.setTeachingType(multiRequest
					.getParameter("teachingType"));
			institution.setTeachingPrice(multiRequest
					.getParameter("teachingPrice"));
			institution.setIsListen(Integer.parseInt(multiRequest
					.getParameter("isListen")));
			institution.setQq(multiRequest.getParameter("qq"));
			institution.setAreaId(Integer.parseInt(multiRequest
					.getParameter("areaId")));
			institution.setAddress(multiRequest.getParameter("address"));
			institution.setLng(multiRequest.getParameter("lng"));
			institution.setLat(multiRequest.getParameter("lat"));
			institution.setSort(Integer.parseInt(multiRequest
					.getParameter("sort")));
			institution.setIntroduce(multiRequest.getParameter("introduce"));

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
								|| "JPG".equals(type.toUpperCase())) {

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

							institution.setLogo(trueFileName);
							int row = institutionDao
									.updateInstitution(institution);

							if (row != 0) {

								// 尝试删除原先图片
								String preImg = multiRequest
										.getParameter("preInstitutionLogo");
								// 设置存放图片文件的路径
								path = realPath + "static/institutionimg/"
										+ preImg;
								new File(path).delete();

								/* System.getProperty("file.separator")+ */
								// 设置存放图片文件的路径
								path = realPath + "static/institutionimg/"
										+ trueFileName;

								// 转存文件到指定的路径
								file.transferTo(new File(path));

								map.put("success", true);

							} else {
								new File(path).delete();
								map.put("success", false);
								map.put("message", "上传失败！");
							}
							return map;

						} else {

							institution.setLogo(multiRequest
									.getParameter("preInstitutionLogo"));

							institutionDao.updateInstitution(institution);

							map.put("success", false);
							map.put("message", "上传失败，文件类型非图片格式");
							return map;
						}

					} else {
						institution.setLogo(multiRequest
								.getParameter("preInstitutionLogo"));

						institutionDao.updateInstitution(institution);

						map.put("success", false);
						map.put("message", "上传失败，文件类型为空!");
						return map;
					}
				} else {
					institution.setLogo(multiRequest
							.getParameter("preInstitutionLogo"));

					institutionDao.updateInstitution(institution);

					map.put("success", false);
					map.put("message", "没有找到相对应的文件");
					return map;
				}
			}
		}

		return map;
	}

	@Override
	public int updatePhoto(int iId, String photo) {

		return institutionDao.updatePhoto(iId, photo);
	}

	@Override
	public Map<String, Object> pubInstitutionInfo(HttpServletRequest request)
			throws IllegalStateException, IOException {

		Map<String, Object> map = new HashMap<String, Object>();

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

							// 自定义的文件名称
							String trueFileName = String.valueOf(System
									.currentTimeMillis())
									+ fileName;

							trueFileName = trueFileName.replace(",", "");

							if (trueFileName.length() > 150) {// 文件名称太长

								trueFileName = trueFileName.substring(0, 13)
										+ trueFileName.substring(trueFileName
												.length() - 10, trueFileName
												.length());
							}

							/* System.getProperty("file.separator")+ */
							// 设置存放图片文件的路径
							path = realPath + "static/institutionimg/"
									+ trueFileName;

							String[] kemudaleis = multiRequest
									.getParameterValues("kemudalei");
							String kemudalei = "";
							for (int k = 0; k < kemudaleis.length; k++) {
								kemudalei += kemudaleis[k] + ",";
							}

							Institution institution = new Institution();
							institution.setiName(multiRequest
									.getParameter("iName"));
							institution.setKemudalei(kemudalei);
							institution.setCourse(multiRequest
									.getParameter("course"));
							institution.setContactName(multiRequest
									.getParameter("contactName"));
							institution.setContactPhone(multiRequest
									.getParameter("contactPhone"));
							institution.setTeachingType(multiRequest
									.getParameter("teachingType"));
							institution.setTeachingPrice(multiRequest
									.getParameter("teachingPrice"));
							institution.setIsListen(Integer
									.parseInt(multiRequest
											.getParameter("isListen")));
							institution.setQq(multiRequest.getParameter("qq"));
							institution.setLogo(trueFileName);
							institution.setAreaId(Integer.parseInt(multiRequest
									.getParameter("areaId")));
							institution.setAddress(multiRequest
									.getParameter("TeachAddress"));
							institution
									.setLng(multiRequest.getParameter("lng"));
							institution
									.setLat(multiRequest.getParameter("lat"));
							institution.setSort(Integer.parseInt(multiRequest
									.getParameter("sort")));
							institution.setIntroduce(multiRequest
									.getParameter("introduce"));

							int row = institutionDao.insert(institution);

							if (row != 0) {
								// 转存文件到指定的路径
								file.transferTo(new File(path));
							}

							map.put("信息：", fileName + "上传成功！");

						}

					}
				}
			}
		}

		return null;
	}
}
