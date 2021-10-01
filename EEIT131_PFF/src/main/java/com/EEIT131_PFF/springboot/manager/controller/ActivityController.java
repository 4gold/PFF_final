package com.EEIT131_PFF.springboot.manager.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.EEIT131_PFF.springboot.model.Activity;

import com.EEIT131_PFF.springboot.manager.service.ActivityService;


@Controller
public class ActivityController {

	@Autowired
	ActivityService activityService;

	@GetMapping("/manager/allactivity")
	public @ResponseBody List<Activity> findAllActivity() {
		return activityService.findAllActivity();
	}

	@GetMapping("/manager/allactivitypage")
	public String findAllactivity() {
		return "manager/ShowActivitys";
	}
	//找總數量共有多少
//	@GetMapping("/manager/howmanyactivitypage")
//	public String findhowmanyactivity(@RequestParam("hql1") String hql1, Model model) {
//		model.getAttribute("hql1");
//		System.out.println(hql1);
//		System.out.println(hql1);
//		System.out.println(hql1);
//		System.out.println(hql1);
//		System.out.println(hql1);
//		System.out.println(hql1);
//		
//		return activityService.findHowmanyactivity(hql1);
//	}

	//--------------------------------------------------
	
	//找照片

	
	@GetMapping("/manager/allactivityimagepage")
	 public String findAllImage() {
	  return "manager/ShowActivitys";
	 }
	
	@GetMapping("/image/getCoverImage")
	public ResponseEntity<byte[]> getCoverImage(
			@RequestParam("activityId") Integer activityId
			){
		System.out.println(activityId);
		ResponseEntity<byte[]> re = null;
		Activity activity = activityService.findById(activityId);
		HttpHeaders headers = new HttpHeaders();
		if(activity.getCoverImage()!=null) {
			Blob blob= activity.getCoverImage();
			MediaType mediaType = MediaType.valueOf(activity.getMimeType());
			System.out.println(blob);
			try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			InputStream is = blob.getBinaryStream();
			byte[] b = new byte[81920];
			int len = 0;
			while((len=is.read(b))!=-1) {
				baos.write(b,0,len);
			}
			headers.setContentType(mediaType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			re = new ResponseEntity<byte[]>(baos.toByteArray(),HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			headers.setContentType(null);
			re = null;
			System.out.println(activity.getActivityId()+"doesn't have images");
		}
		return re;
	}
	// ---------------------------------------------------------

	// 新增活動資料
	@GetMapping("/manager/addactivity")
	public String addActivityForm(Model model) {
		return "manager/AddActivity";
	}

//	@PostMapping("/activity/addactivitypage")
//	public @ResponseBody Map<String, String> save(@RequestBody Activity activity) {
//		System.out.println("Activity=" + activity);
//		Map<String, String> map = new HashMap<>();
//		String result = "";
//
//		// 欄位判斷式
//		if (activity.getDiscount() == null || activity.getTitle() == null) {
//			map.put("fail", "活動欄位及活動名稱不可為空");
//			return map;
//		}
//		try {
//			ActivityService.save(activity);
//			result = "新增成功";
//			map.put("success", result);
//		} catch (Exception e) {
//			result = e.getMessage();
//			map.put("fail", result);
//		}
//		return map;
//	}
	// -----------------------------------------------------------------------------------------------

	// 修改活動資料
	@GetMapping("/manager/updateactivitys")
	public String sendEditActivityForm(@RequestParam("activityId") Integer activityId, Model model) {
		model.addAttribute("Act", activityId);
		return "manager/UpdateActivity";
	}

//	@GetMapping("/activity/updateactivitypage")
//	public String sendAjaxActivityForm() {
//		return "manager/ShowActivitys";
//	}

	@GetMapping("/manager/activitys")
	public @ResponseBody Activity findByActivityId(@RequestParam Integer activityId) {
		System.out.println("activityId=" + activityId);
		return activityService.findByActivityId(activityId);
	}

	@GetMapping("/manager/activitys/{activityId}")
	public @ResponseBody Activity findById(@PathVariable Integer activityId) {
		return activityService.findById(activityId);
	}
	
	

	@PutMapping(value = "/manager/updateactivity/{activityId}",produces = { "application/json; charset=UTF-8" })
	public @ResponseBody Map<String, String> updateImage(@RequestBody Activity activity) {
		System.out.println("update()之 activityId=" + activity);
		Map<String, String> map = new HashMap<>();
		String result = "";
		String i = activity.getFileDataURL();
		if (activity.getFileDataURL() != null) {
			int startIndex = "data:".length();
			System.out.println(activity.getFileDataURL());
			int endIndex = activity.getFileDataURL().indexOf(",");
			String mimeType = activity.getFileDataURL().substring(startIndex, endIndex);
			String base64 = activity.getFileDataURL().substring(activity.getFileDataURL().indexOf(",") + 1);
			byte[] a = Base64.getDecoder().decode(base64);
			System.out.println(a);
			System.out.println(base64);
			System.out.println(mimeType);
			try {
				activity.setCoverImage(new SerialBlob(a));
			} catch (SerialException e) {
				e.printStackTrace();
				result = e.getMessage();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			activity.setMimeType(mimeType);
			activity.setFileDataURL(i);

			// partner.getProducts().add(product);

		} else {

			activity.setCoverImage(null);
			activity.setMimeType(null);
		}
		System.out.println(activity);

		if (activity.getDiscount() == null || activity.getTitle() == null) {
			map.put("fail", "活動欄位及活動名稱不可為空");
		}
		
		try {
			activityService.update(activity);
			result = "修改成功,3秒後跳轉";
			map.put("success", result);
		} catch (Exception e) {
			result = e.getMessage();
			map.put("fail", result);
		}
		return map;
	}
	// --------------------------------------------------------------------

	// 刪除
	@DeleteMapping(path = "/manager/deleteactivity/{activityId}")
	public String DeleteActivity(@PathVariable Integer activityId) {
		activityService.DeleteActivity(activityId);
         
		return "true";
	}

	// ------------------------------------------------------------------

	// 新增活動&照片
	@GetMapping(value = "/ActivityImageupload")
	public String AddActivityPage() {
		return "manager/AddActivity";
	}

	@PostMapping(value = "/manager/addactivitypage", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody Map<String, String> saveImage(@RequestBody Activity activity) {
		Map<String, String> map = new HashMap<>();
		String result = "";

		try {
			activityService.save(activity);
			result = "新增成功,3秒後跳轉";
			map.put("success", result);
		} catch (Exception e) {
			result = e.getMessage();
			map.put("fail", result);
		}

		// 因為是新增的所以一定是最後一筆
		activity = activityService.findLastActivity();

		String i = activity.getFileDataURL();
		if (activity.getFileDataURL() != null) {
			int startIndex = "data:".length();
			System.out.println(activity.getFileDataURL());
			int endIndex = activity.getFileDataURL().indexOf(",");
			String mimeType = activity.getFileDataURL().substring(startIndex, endIndex);
			String base64 = activity.getFileDataURL().substring(activity.getFileDataURL().indexOf(",") + 1);
			byte[] a = Base64.getDecoder().decode(base64);
			System.out.println(a);
			System.out.println(base64);
			System.out.println(mimeType);
			try {
				activity.setCoverImage(new SerialBlob(a));
			} catch (SerialException e) {
				e.printStackTrace();
				result = e.getMessage();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			activity.setMimeType(mimeType);
			activity.setFileDataURL(i);

			
			// partner.getProducts().add(product);

		} else {

			activity.setCoverImage(null);
			activity.setMimeType(null);
			
		}
		System.out.println(activity);
		activityService.save(activity);

		if (activity.getDiscount() == null || activity.getTitle() == null) {
			map.put("fail", "活動欄位及活動名稱不可為空");
		}
		return map;
	}
	
	//--------------------------------------------------------活動上下架時間控制器-------------------------------------------------------------------
	
//	// 檢視活動&照片
//	@GetMapping(value = "/ShowActivitysFOR")
//	public String ShowAddActivityPage1() {
//		return "manager/ShowActivitysFOR";
//	}
	
	@GetMapping(value = "/ShowActivitysFOR")
	public String ShowAddActivityPage2() {
		return "manager/ShowActivitysFOR";
	}
	
	@GetMapping(value = "image/ShowActivitysFOR")
	public @ResponseBody List<Activity> ShowAddActivityPage() {
		return activityService.findAllActivity();
	}
	
	
}