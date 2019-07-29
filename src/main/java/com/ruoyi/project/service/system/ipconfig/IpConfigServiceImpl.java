package com.ruoyi.project.service.system.ipconfig;

import java.util.List;
import org.springframework.stereotype.Service;
import com.ruoyi.project.mapper.mysql.system.ipconfig.IpConfigMapper;
import com.ruoyi.project.domain.system.ipconfig.IpConfig;
import com.ruoyi.common.utils.text.Convert;

import javax.annotation.Resource;

/**
 * ip过滤 服务层实现
 *
 * @author ruoyi
 * @date 2019-06-24
 */
@Service
public class IpConfigServiceImpl implements IIpConfigService
{
	@Resource
	private IpConfigMapper ipConfigMapper;

	/**
     * 查询ip过滤信息
     *
     * @param id ip过滤ID
     * @return ip过滤信息
     */
    @Override
	public IpConfig selectIpConfigById(Integer id)
	{
	    return ipConfigMapper.selectIpConfigById(id);
	}

	/**
     * 查询ip过滤列表
     *
     * @param ipConfig ip过滤信息
     * @return ip过滤集合
     */
	@Override
	public List<IpConfig> selectIpConfigList(IpConfig ipConfig)
	{
	    return ipConfigMapper.selectIpConfigList(ipConfig);
	}

    /**
     * 新增ip过滤
     *
     * @param ipConfig ip过滤信息
     * @return 结果
     */
	@Override
	public int insertIpConfig(IpConfig ipConfig)
	{
	    return ipConfigMapper.insertIpConfig(ipConfig);
	}

	/**
     * 修改ip过滤
     *
     * @param ipConfig ip过滤信息
     * @return 结果
     */
	@Override
	public int updateIpConfig(IpConfig ipConfig)
	{
	    return ipConfigMapper.updateIpConfig(ipConfig);
	}

	/**
     * 删除ip过滤对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteIpConfigByIds(String ids)
	{
		return ipConfigMapper.deleteIpConfigByIds(Convert.toStrArray(ids));
	}

}
