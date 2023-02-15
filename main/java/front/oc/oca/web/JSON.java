package front.oc.oca.web;

import org.springframework.http.HttpStatus;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JSON extends ModelAndView {

    protected HttpServletRequest request;
    private ModelMap model;

    public void setRequest(HttpServletRequest req) {
        this.request = req;
    }

    public JSON() {
        this.model = getModelMap();
        this.setView(new JSONView());
    }
    public JSON(HttpStatus httpStatus, Map<String, String> header) {
        this.model = getModelMap();
        this.setView(new JSONView(httpStatus, header));
    }

    public JSON put(String s, List<Map<String, Object>> l) {
        model.addAttribute(s, l);
        return this;
    }

    public JSON put(String s, ArrayList<String> storageStrArray) {
        model.addAttribute(s, storageStrArray);
        return this;
    }

    public JSON put(String s, Map<String, Object> o) {
        model.addAttribute(s, o);
        return this;
    }

    public JSON put(String s, String s1) {
        model.addAttribute(s, s1);
        return this;
    }
    
    public JSON put(String s, int i) {
        model.addAttribute(s, i);
        return this;
    }

    public JSON put(String s, boolean b) {
        model.addAttribute(s, b);
        return this;
    }

    public JSON put(String s, String[] arr) {
        model.addAttribute(s, arr);
        return this;
    }
}
