-------------------------------------------------------------------------
-- SQL Name: rk1809d.ctl
--
-- Function: select from hb_item_chain
--
-- $Workfile:   rk1809d.ctl  $
--
-- $Revision:   1.2  $
--
-- $Log:   //ccpvcs01/pvcsvm/R7_RMS/BatRunscpt/rk1809d.ctv  $
-- 
--    Rev 1.2   27 Apr 2007 15:39:18   bssrd51
-- Also select from item_supplier_cont and select item of chain 6 only
-- 
--    Rev 1.1   20 Apr 2007 15:49:08   bssrd51
-- Expand file to include supplier and item supplier data
-- 
--    Rev 1.0   19 Apr 2007 14:56:48   bssrd51
-- Initial version
-- 
-------------------------------------------------------------------------
SELECT LPAD(HIC.ITEM,8,'0')
      ,LPAD(HIC.SUPPLIER,10,'0')
      ,HIC.DISCONTINUED_IND
      ,HIC.MANAGED_BY_CODE
      ,HIC.STOCK_CAT
      ,S.SUP_NAME
      ,S.CURRENCY_CODE
      ,ISU.VPN
      ,LPAD(10000*CURRENCY_SQL.CONVERT_COST(ISU.UNIT_COST,S.CURRENCY_CODE,'CAD'),20,'0')
      ,LPAD(ISU.INNER_PACK_SIZE,4,'0')
      ,LPAD(ISU.SUPP_PACK_SIZE,4,'0')
FROM   HB_ITEM_CHAIN HIC, 
       SUPS S,
       ITEM_SUPPLIER ISU
WHERE  HIC.SUPPLIER = S.SUPPLIER
AND    HIC.ITEM = ISU.ITEM(+)
AND    HIC.SUPPLIER = ISU.SUPPLIER(+)
ORDER BY 1, 2
;
