package com.emin.yuce.model;


import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author eminy
 */
@Entity
@Table(name = "user")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
    @NamedQuery(name = "User.findByAdressFilter", query = "SELECT u FROM User u WHERE u.adressFilter = :adressFilter"),
    @NamedQuery(name = "User.findByCommandTimeout", query = "SELECT u FROM User u WHERE u.commandTimeout = :commandTimeout"),
    @NamedQuery(name = "User.findByDescription", query = "SELECT u FROM User u WHERE u.description = :description"),
    @NamedQuery(name = "User.findByInactivityTimeout", query = "SELECT u FROM User u WHERE u.inactivityTimeout = :inactivityTimeout"),
    @NamedQuery(name = "User.findByLocked", query = "SELECT u FROM User u WHERE u.locked = :locked"),
    @NamedQuery(name = "User.findByLoginMessage", query = "SELECT u FROM User u WHERE u.loginMessage = :loginMessage"),
    @NamedQuery(name = "User.findByMaxConcurrentSessions", query = "SELECT u FROM User u WHERE u.maxConcurrentSessions = :maxConcurrentSessions"),
    @NamedQuery(name = "User.findByMustChangedPasswd", query = "SELECT u FROM User u WHERE u.mustChangedPasswd = :mustChangedPasswd"),
    @NamedQuery(name = "User.findByName", query = "SELECT u FROM User u WHERE u.name = :name"),
    @NamedQuery(name = "User.findByNoPasswordExpiration", query = "SELECT u FROM User u WHERE u.noPasswordExpiration = :noPasswordExpiration"),
    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password"),
    @NamedQuery(name = "User.findByTimeout", query = "SELECT u FROM User u WHERE u.timeout = :timeout"),
    @NamedQuery(name = "User.findByUseGlobalCommandTimeout", query = "SELECT u FROM User u WHERE u.useGlobalCommandTimeout = :useGlobalCommandTimeout"),
    @NamedQuery(name = "User.findByUseGlobalLoginMessage", query = "SELECT u FROM User u WHERE u.useGlobalLoginMessage = :useGlobalLoginMessage"),
    @NamedQuery(name = "User.findByUseInternalDbAuth", query = "SELECT u FROM User u WHERE u.useInternalDbAuth = :useInternalDbAuth")})
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "ADRESS_FILTER")
    private String adressFilter;
    @Column(name = "COMMAND_TIMEOUT")
    private Integer commandTimeout;
    @Column(name = "DESCRIPTION")
    private String description;
    @Column(name = "INACTIVITY_TIMEOUT")
    private String inactivityTimeout;
    @Column(name = "LOCKED")
    private Boolean locked;
    @Column(name = "LOGIN_MESSAGE")
    private String loginMessage;
    @Column(name = "MAX_CONCURRENT_SESSIONS")
    private Integer maxConcurrentSessions;
    @Column(name = "MUST_CHANGED_PASSWD")
    private Boolean mustChangedPasswd;
    @Column(name = "NAME")
    private String name;
    @Column(name = "NO_PASSWORD_EXPIRATION")
    private Boolean noPasswordExpiration;
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "TIMEOUT")
    private Integer timeout;
    @Column(name = "USE_GLOBAL_COMMAND_TIMEOUT")
    private Boolean useGlobalCommandTimeout;
    @Column(name = "USE_GLOBAL_LOGIN_MESSAGE")
    private Boolean useGlobalLoginMessage;
    @Column(name = "USE_INTERNAL_DB_AUTH")
    private Boolean useInternalDbAuth;

    public User() {
    }

    public User(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdressFilter() {
        return adressFilter;
    }

    public void setAdressFilter(String adressFilter) {
        this.adressFilter = adressFilter;
    }

    public Integer getCommandTimeout() {
        return commandTimeout;
    }

    public void setCommandTimeout(Integer commandTimeout) {
        this.commandTimeout = commandTimeout;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInactivityTimeout() {
        return inactivityTimeout;
    }

    public void setInactivityTimeout(String inactivityTimeout) {
        this.inactivityTimeout = inactivityTimeout;
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }

    public String getLoginMessage() {
        return loginMessage;
    }

    public void setLoginMessage(String loginMessage) {
        this.loginMessage = loginMessage;
    }

    public Integer getMaxConcurrentSessions() {
        return maxConcurrentSessions;
    }

    public void setMaxConcurrentSessions(Integer maxConcurrentSessions) {
        this.maxConcurrentSessions = maxConcurrentSessions;
    }

    public Boolean getMustChangedPasswd() {
        return mustChangedPasswd;
    }

    public void setMustChangedPasswd(Boolean mustChangedPasswd) {
        this.mustChangedPasswd = mustChangedPasswd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getNoPasswordExpiration() {
        return noPasswordExpiration;
    }

    public void setNoPasswordExpiration(Boolean noPasswordExpiration) {
        this.noPasswordExpiration = noPasswordExpiration;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getTimeout() {
        return timeout;
    }

    public void setTimeout(Integer timeout) {
        this.timeout = timeout;
    }

    public Boolean getUseGlobalCommandTimeout() {
        return useGlobalCommandTimeout;
    }

    public void setUseGlobalCommandTimeout(Boolean useGlobalCommandTimeout) {
        this.useGlobalCommandTimeout = useGlobalCommandTimeout;
    }

    public Boolean getUseGlobalLoginMessage() {
        return useGlobalLoginMessage;
    }

    public void setUseGlobalLoginMessage(Boolean useGlobalLoginMessage) {
        this.useGlobalLoginMessage = useGlobalLoginMessage;
    }

    public Boolean getUseInternalDbAuth() {
        return useInternalDbAuth;
    }

    public void setUseInternalDbAuth(Boolean useInternalDbAuth) {
        this.useInternalDbAuth = useInternalDbAuth;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "User[ id=" + id + " ]";
    }
    
}
