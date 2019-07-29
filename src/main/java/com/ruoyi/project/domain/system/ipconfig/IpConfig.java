package com.ruoyi.project.domain.system.ipconfig;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * ip过滤表 sys_ip_config
 *
 * @author ruoyi
 * @date 2019-06-24
 */
public class IpConfig extends BaseEntity
{
	private static final long serialVersionUID = 1L;

	/** id */
	private Integer id;
	/** ip */
	private String ip;
	/** 状态 0：禁止 1：允许 */
	private String status;

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getId()
	{
		return id;
	}
	public void setIp(String ip)
	{
		this.ip = ip;
	}

	public String getIp()
	{
		return ip;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getStatus()
	{
		return status;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("ip", getIp())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
