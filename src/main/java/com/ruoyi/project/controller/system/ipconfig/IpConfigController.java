package com.ruoyi.project.controller.system.ipconfig;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.domain.system.ipconfig.IpConfig;
import com.ruoyi.project.service.system.ipconfig.IIpConfigService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * ip过滤信息操作处理
 *
 * @author ruoyi
 * @date 2019-06-24
 */
@Controller
@RequestMapping("/system/ipConfig")
public class IpConfigController extends BaseController
{
    private String prefix = "system/ipConfig";

	@Autowired
	private IIpConfigService ipConfigService;

	@RequiresPermissions("system:ipConfig:view")
	@GetMapping()
	public String ipConfig()
	{
	    return prefix + "/ipConfig";
	}

	/**
	 * 查询ip过滤列表
	 */
	@RequiresPermissions("system:ipConfig:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(IpConfig ipConfig)
	{
		startPage();
        List<IpConfig> list = ipConfigService.selectIpConfigList(ipConfig);
		return getDataTable(list);
	}


	/**
	 * 导出ip过滤列表
	 */
	@RequiresPermissions("system:ipConfig:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(IpConfig ipConfig)
    {
    	List<IpConfig> list = ipConfigService.selectIpConfigList(ipConfig);
        ExcelUtil<IpConfig> util = new ExcelUtil<IpConfig>(IpConfig.class);
        return util.exportExcel(list, "ipConfig");
    }

	/**
	 * 新增ip过滤
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}

	/**
	 * 新增保存ip过滤
	 */
	@RequiresPermissions("system:ipConfig:add")
	@Log(title = "ip过滤", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(IpConfig ipConfig)
	{
		return toAjax(ipConfigService.insertIpConfig(ipConfig));
	}

	/**
	 * 修改ip过滤
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		IpConfig ipConfig = ipConfigService.selectIpConfigById(id);
		mmap.put("ipConfig", ipConfig);
	    return prefix + "/edit";
	}

	/**
	 * 修改保存ip过滤
	 */
	@RequiresPermissions("system:ipConfig:edit")
	@Log(title = "ip过滤", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(IpConfig ipConfig)
	{
		return toAjax(ipConfigService.updateIpConfig(ipConfig));
	}

	/**
	 * 删除ip过滤
	 */
	@RequiresPermissions("system:ipConfig:remove")
	@Log(title = "ip过滤", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{
		return toAjax(ipConfigService.deleteIpConfigByIds(ids));
	}

}
