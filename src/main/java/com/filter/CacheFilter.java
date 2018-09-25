package com.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class CacheFilter implements javax.servlet.Filter {
    FilterConfig filterConfig = null;
    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }
    @Override
    public void doFilter(ServletRequest req,ServletResponse res,FilterChain chain)throws IOException,ServletException {
        String sCache = filterConfig.getInitParameter("Cache");
        if (sCache != null) {
                ((HttpServletResponse) res).setHeader("Cache-Control", sCache);
        }
        chain.doFilter(req, res);
    }
    @Override
    public void destroy() {
        this.filterConfig = null;
    }
}