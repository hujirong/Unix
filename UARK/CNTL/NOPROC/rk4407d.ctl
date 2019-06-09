-- Script: rk4407d.ctl
-- Decription: Extract Transfer Out from WH
-- Jirong Test: 1
-- $Workfile:   rk4407d.ctl  $
-- $Revision:   1.7  $
-- $Log:   //ccpvcs01/pvcsvm/R7_RMS/BatRunscpt/rk4407d.ctv  $
--
--   Rev 1.7   23 Oct 2007 16:57:54   bssrd39
--Tsf_qty only extracted from HBC side for all transfers out of a warehouse.
--
--   Rev 1.6   29 Mar 2007 11:01:44   bssrd51
--Correct the comment syntax created by PVCS
-- 
--    Rev 1.5   02 Mar 2007 17:11:28   bssrd51
-- Extract chain
--
SELECT 	D.SKU, 
        H.FROM_LOC, 
        rpad('+0', 13, '0'),
	to_char (NVL (SUM (D.TSF_QTY), 0)*10000, 'S000000000009') TSF_QTY,
        lpad(M.STOCK_CHAIN,2,'0')
FROM    TSFDETAIL D, 
        TSFHEAD H,
        HB_ITEM_WH W,
        HB_WH_STOCKING_MODEL M
WHERE   H.TSF_NO = D.TSF_NO
AND     H.FROM_LOC_TYPE = 'W'
AND     H.STATUS IN ('I', 'A', 'E', 'S')
AND     NVL(D.TSF_QTY, 0) > 0
AND     H.FROM_LOC = W.WH
AND     D.SKU = W.ITEM
AND     W.STOCKING_MODEL = M.STOCKING_MODEL
AND     H.CHAIN = M.CHAIN
GROUP BY D.SKU, H.FROM_LOC, M.STOCK_CHAIN
;
