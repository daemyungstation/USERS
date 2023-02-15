package front.oc.oca.service;

import emf.core.vo.EmfMap;

import java.util.Map;

public interface DoznBankingService {

    /**
     * <pre>
     * 1. MethodName : inquireDepositor
     * 2. ClassName  : CommonAccountService.java
     * 3. Comment    : 예금주 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 29.
     * </pre>
     *
     * @param commandMap
     * @param bankCode 
     * @param accountNum 
     * @param birthday 
     * @return
     */
    public Map<String, Object> inquireDepositor(EmfMap emfMap);

}
