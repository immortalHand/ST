package st.pojo;

import java.util.Date;

public class User {
    private Integer id;

    private String name;

    private String password;

    private Integer organizationid;

    private String img;

    private String time;

    private String phone;

    private String information;

    private Integer stuno;

    private Integer type;

    private Integer activeid;
    
    private String organnizationname;
    
    

    public String getOrgannizationname() {
		return organnizationname;
	}

	public void setOrgannizationname(String organnizationname) {
		this.organnizationname = organnizationname;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getOrganizationid() {
        return organizationid;
    }

    public void setOrganizationid(Integer organizationid) {
        this.organizationid = organizationid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information == null ? null : information.trim();
    }

    public Integer getStuno() {
        return stuno;
    }

    public void setStuno(Integer stuno) {
        this.stuno = stuno;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getActiveid() {
        return activeid;
    }

    public void setActiveid(Integer activeid) {
        this.activeid = activeid;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password
				+ ", organizationid=" + organizationid + ", img=" + img
				+ ", time=" + time + ", phone=" + phone + ", information="
				+ information + ", stuno=" + stuno + ", type=" + type
				+ ", activeid=" + activeid + ", organnizationname="
				+ organnizationname + "]";
	}
    
    
}