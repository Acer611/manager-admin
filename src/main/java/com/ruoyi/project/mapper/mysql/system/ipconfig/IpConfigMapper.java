package com.ruoyi.project.mapper.mysql.system.ipconfig;

import com.ruoyi.project.domain.system.ipconfig.IpConfig;
import java.util.List;

/**
 * ip过滤 数据层
 *
 * @author ruoyi
 * @date 2019-06-24
 */
public interface IpConfigMapper
{
	/**
     * 查询ip过滤信息
     *
     * @param id ip过滤ID
     * @return ip过滤信息
     */
	public IpConfig selectIpConfigById(Integer id);

	/**
     * 查询ip过滤列表
     *
     * @param ipConfig ip过滤信息
     * @return ip过滤集合
     */
	public List<IpConfig> selectIpConfigList(IpConfig ipConfig);

	/**
     * 新增ip过滤
     *
     * @param ipConfig ip过滤信息
     * @return 结果
     */
	public int insertIpConfig(IpConfig ipConfig);

	/**
     * 修改ip过滤
     *
     * @param ipConfig ip过滤信息
     * @return 结果
     */
	public int updateIpConfig(IpConfig ipConfig);

	/**
     * 删除ip过滤
     *
     * @param id ip过滤ID
     * @return 结果
     */
	public int deleteIpConfigById(Integer id);

	/**
     * 批量删除ip过滤
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteIpConfigByIds(String[] ids);

}
