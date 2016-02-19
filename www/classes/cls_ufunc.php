<?php
Class UFunc{
/// start class
//private $_new_limit = 12;
private $_new_descr = "Быть модной сегодня – это значит, быть не как все. У нас Вы всегда найдете самые последние коллекции модных платьев от известных дизайнеров и популярных брендов.";

public $_cart = array(
        "summary"=>array("qty"=>0,"discount"=>0,"sum"=>0,"sum_d"=>0,"postalcost"=>0,"total"=>0),
        "items"=>array()
    );    

// utils    
function getSODiscount(){
    global $utils;
    
    $query= "SELECT title, discount FROM specoffer_tbl limit 1";			
    $dt = $utils->GetAssocArray($query);		
    
    $discount=(count($dt)>0)? $dt[0]["DISCOUNT"]:5;    
    
    return $discount;
}

function getSumDiscount($sum){
    global $utils;
    
    $query= "
        select sum_limit, discount 
        from ref_discount_tbl 
        where isactive=1
        and sum_limit<=".$sum."
        order by sum_limit desc        
        ";			
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt[0]["DISCOUNT"] : 0;
}

function getSumLimit($discount){
    global $utils;
    
    $query= "
        select sum_limit, discount 
        from ref_discount_tbl 
        where discount=".$discount."      
        ";			
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt[0]["SUM_LIMIT"] : 0;
}

function getCatTree($open_id){
    global $utils, $sql;
    $query = "select id, parentid from category_tbl where 1=1";
    $apath = array();
    $arr0=array();
    $arr0=$utils->getTreePath($query,$open_id,$arr0);
    array_push($apath,$arr0);

    $query=$sql["cat_tree_active"];
    $dt0 = array();
    $dt_tree = $utils->BuildTree($query,0,$dt0,0,$apath);
    
    $dt_tree[] = array("ID"=>"new","NAME"=>"Новинки","LEVEL"=>1,"SUBS"=>0,"NC"=>true);
    
    return $dt_tree;    
}

function getCatInfo($open_id){
    global $utils;
//var_dump(" getCatInfo($open_id) ");
    $dt = array();
    switch($open_id){
        case "new":
            $dt[0] = array("ID"=>0,"NAME"=>"Новинки","DESCR"=>$this->_new_descr);
            break;
        case "search":
            $dt[0] = array("ID"=>-1,"NAME"=>"Поиск","DESCR"=>$this->_new_descr);
            break;
        default:
            if($open_id > 0){
                $query = "
                    select 
                        c.ID, c.NAME, 
                        IFNULL(c.descr,c0.descr) as descr,
                        c.parentid
                    from category_tbl c
                    left join category_tbl c0 on c.parentid = c0.id
                    where c.id = ".$open_id;
                $dt = $utils->GetAssocArray($query);
            }            
            break;
    }
    /*if(in_array($open_id, array("new", "search"))){
        $dt[0] = array("ID"=>0,"NAME"=>"Новинки","DESCR"=>$this->_new_descr);
    }else{
        if($open_id > 0){
            $query = "
                select 
                    c.ID, c.NAME, 
                    IFNULL(c.descr,c0.descr) as descr,
                    c.parentid
                from category_tbl c
                left join category_tbl c0 on c.parentid = c0.id
                where c.id = ".$open_id;
            $dt = $utils->GetAssocArray($query);
        }
    }*/

    return count($dt)>0 ? $dt[0] : false;
}

function getCatMinMaxPrice($open_id,$c_path,$so_discount,$where=array()){
    global $utils;
    
    $where_cat = '';
    if(!in_array($open_id,array("new","search"))){
        $where_cat = " AND ( ".$open_id."=0 OR wc.categoryid IN (".implode(',',$c_path)."))";
    }
    $query = "
        select 
            ifnull(floor(min(if(w.isspecoffer, round((w.price - w.price*".$so_discount."/100),2), w.price))),0) as price_min, 
            ifnull(round(max(if(w.isspecoffer, round((w.price - w.price*".$so_discount."/100),2), w.price))),10000) as price_max
        from ware_tbl w
        join ware_category_tbl wc on w.id = wc.wareid
        where 1=1
        ".$where_cat."
        ".implode(' ',$where)."
        ";
    //var_dump($query);
    $dt = $utils->GetAssocArray($query);

    return count($dt)>0 ? $dt[0] : array("PRICE_MIN"=>0,"PRICE_MAX"=>10000);
}

function getPaymentTypeById($paymenttype_id){
    global $utils;

    $query = "select id, name, details from ref_paymenttype_tbl where id = ".$paymenttype_id;
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt[0] : false;
}

function getPaymentTypes(){
    global $utils;

    $query = "select id, name from ref_paymenttype_tbl where isactive = 1";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;
}

function getSizeTypes(){
    global $utils;
    //var_dump(" getSizesLight() ");
    $query = "select id, name from ref_sizetype_tbl where isactive = 1";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;
}

function getSizes(){
    global $utils;

    $query = "select id, name from ref_size_tbl where isactive = 1";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;
}

function getSizeLabel($sizetype_id, $size_id){
    global $utils;
    
    $query = "
        select concat(szt.name, ' ', sz.name) as label
        from ref_sizetype_tbl szt 
        join ref_size_tbl sz on sz.id = ".$size_id."
        where szt.id = ".$sizetype_id."    
        ";
    
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt[0]["LABEL"] : false;    
}

function getSiteblockByName($name){
    global $utils;
    
    $query = "select * from siteblock_tbl where name = '_".$name."'";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt[0] : false;
}

function getSiteblocks(){
    global $utils;
    
    $query = "select * from siteblock_tbl order by sequence";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;
}

function get_WareImages($ware_id, $ex_image_id=0){
    global $utils;
    
    $query = "
        select ware_id, image_id, extension as ext 
        from ware_image_tbl
        where ware_id = ".$ware_id."
        and image_id <> ".$ex_image_id."
        ";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;    
}

function get_WareSizes($ware_id){
    global $utils;
    
    $query = "
        select sizetype_id, size_id
        from ware_sizetype_size_tbl
        where ware_id = ".$ware_id."
            and 
        ";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;      
}

function get_WareSizes_Ext($ware_id){
    global $utils;
    
    $query = "
        select 
            szt.id as sizetype_id,
            sz.id as size_id, sz.name as size_name,
            if(szt_sz.sizetype_id is null, 1, 0) as gap,
            if(w_sz.sizetype_id is null, 1, 0) as ware
        from ref_sizetype_tbl szt
        left join ref_size_tbl sz on 1=1
        left join ref_sizetype_size_tbl szt_sz on szt.id = szt_sz.sizetype_id and sz.id = szt_sz.size_id
        left join ware_sizetype_size_tbl w_sz on w_sz.ware_id=".$ware_id." and szt.id = w_sz.sizetype_id and sz.id = w_sz.size_id
        ";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;      
}
        
function get_WareJoint($ware_id,$so_discount=null){
    global $utils;
    
    if(!isset($so_discount)){
        $so_discount = $this->getSODiscount();        
    }
    
    $query = "
        select 
            w.id, w.code, w.name,
            w.price, w.price_ws,
            round((price - price*".$so_discount."/100),2) as so_price,
            round((price_ws - price_ws*".$so_discount."/100),2) as so_price_ws,
            w.isspecoffer as isso,
            wi.image_id, wi.extension as ext,
            if(@wid=w.id,@rownum+1,1) as rank, @wid:=w.id				
        from ware_joint_tbl wj
        join ware_tbl w on w.id = wj.joint_wareid
        join (SELECT @rownum:=1, @wid:=0) r
        left join ware_image_tbl wim on w.id = wim.ware_id and wim.is_main = 1
        left join ware_image_tbl wi on w.id = wi.ware_id and ( (wim.is_main = 1 and wi.is_main=1) or (wim.is_main is null and if(@wid=w.id,@rownum+1,1)=1) )
        where 1=1    
        and wj.wareid = ".$ware_id."
        and w.isactive=1
        group by wj.joint_wareid
        order by creationdate desc 
        ";
    
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt : false;     
}
function getPostalCost($sum){
    global $utils;
    
    $query = "
        select if(".$sum."<=spc.value,pc.value,0) postalcost
        from attributes_tbl pc 
        join attributes_tbl spc on spc.name='stoppostalcost'
        where pc.name='postalcost';
        ";
    $dt = $utils->GetAssocArray($query);
    
    return count($dt)>0 ? $dt[0]["POSTALCOST"] : 0;
}

function getCartLabels($item){
    global $utils;
    
    $query = "
        select 
            concat(szt.name, ' ', sz.name) as size, 
            w.name as ware_name, w.code as ware_code
        from ref_sizetype_tbl szt 
        join ref_size_tbl sz on sz.id = ".$item["size_id"]."
        join ware_tbl w on w.id = ".$item["ware_id"]."
        where szt.id = ".$item["sizetype_id"]."    
        ";
    
    $dt = $utils->GetAssocArray($query);
    $label = count($dt)>0 ? $dt[0] : false;
    
    $query = "
        select 
            image_id, extension as ext,
            concat(ware_id,'_',image_id,'_s.',extension) as image
        from  ware_image_tbl 
        where ware_id = ".$item["ware_id"]."
        order by is_main desc, image_id asc;";
    $dt = $utils->GetAssocArray($query);
    
    //$label["IMAGE"] = count($dt)>0 ? $dt[0]["IMAGE"] : "noimage.jpg";
    $label["IMAGE_ID"] = count($dt)>0 ? $dt[0]["IMAGE_ID"] : "noimage";
    $label["IMAGE_EXT"] = count($dt)>0 ? $dt[0]["EXT"] : "jpg";
    
    return $label;
}

function clearCart(){
    unset($_SESSION["cart"]);

    return $this->getCart();
}

function getCart(){
    $cart = $cart = isset($_SESSION["cart"]) ? $_SESSION["cart"] : $this->_cart;
        
    return $cart;
}

function recalcCart(&$cart){
    global $utils;
    
    $qty=0; $sum=0;
    foreach($cart["items"] as $item_id=>$item){
        $qty += $item["qty"];
        $sum += ($item["price"]*$item["qty"]);
    } 
    $discount = $this->getSumDiscount($sum);    
    $sum_d = $sum - $sum*$discount/100;
    
    $cart["summary"]["qty"] = $qty;
    $cart["summary"]["discount"] = (int)$discount;
    $cart["summary"]["sum"] = $sum;    
    $cart["summary"]["sum_d"] = $sum_d;
    
    $total = ($discount==0 ? $sum : $sum_d);
    $postalcost = $this->getPostalCost($total);
    $cart["summary"]["postalcost"]=$postalcost;
    $cart["summary"]["total"]=$total+$postalcost;
}

function cartIconv(&$cart){
    array_walk_recursive($cart, function(&$value,$key){
        if(in_array($key,array("ware_label","ware_size"))){
            $value=iconv("CP1251","UTF-8",$value);
        }
    });    
}

function cartRemoveItem($item_id){
    $cart = $this->getCart();
 
    unset($cart["items"][$item_id]);
    $this->recalcCart($cart);
    
    $_SESSION["cart"] = $cart;
    
    return $_SESSION["cart"];
}

function cartUpdateItem($item_id, $bind){
    $cart = $this->getCart();
    
    $upd = array($item_id=>$bind);
    $this->cartItemUpdate($upd, $cart);
            
    $this->recalcCart($cart);
    
    $_SESSION["cart"] = $cart;
    
    return $_SESSION["cart"];    
}

function cartItemUpdate($upd, &$cart){
    foreach($upd as $item_id=>$bind){
        foreach($bind as $key=>$val){
            $cart["items"][$item_id][$key] = $val;
        }
    }    
}

function cartAdd($p){
    global $utils;
    
    $cart = $this->getCart();
    
    $upd = array();
    if(count($cart["items"])>0){
        foreach($cart["items"] as $item_id=>$item){
            if($item["ware_id"]==$p["ware_id"] && $item["sizetype_id"]==$p["sizetype_id"] && $item["size_id"]==$p["size_id"] ){
                $upd[$item_id] = array("qty"=>($item["qty"]+$p["qty"]));
            }
        }
    }
    if(count($upd)>0){
        //just update item
        $this->cartItemUpdate($upd, $cart);
    }else{
        //add new item
        $item_id = count($cart["items"])==0 ? 1 : 1+end(array_keys($cart["items"]));
        //$utils->varsexporttofile(array(count($cart["items"]),end(array_keys($cart["items"]))));
        $item =array(
            "ware_id"       =>$p["ware_id"],
            "sizetype_id"   =>$p["sizetype_id"],
            "size_id"       =>$p["size_id"],
            "price"         =>$p["price"],
            "price0"        =>$p["price0"],
            "qty"           =>$p["qty"]        
        );
        $label = $this->getCartLabels($item);
        $item["ware_label"] = $label["WARE_NAME"];
        $item["ware_code"] = $label["WARE_CODE"];
        $item["size_label"] = $label["SIZE"];
        $item["image_id"] = $label["IMAGE_ID"];
        $item["image_ext"] = $label["IMAGE_EXT"];
        
        $cart["items"][$item_id] = $item;
    }
    
    $this->recalcCart($cart);
    
    $_SESSION["cart"] = $cart;
    
    return $_SESSION["cart"];
}

//get data   // actions
function getdata_Home(){
    global $ufunc,$smarty,$utils;
    $so_discount = $ufunc->getSODiscount();
    $num_hit= $utils->get_pageattribute("num_hit");

    //get specoffer
    $query = "
        select 
            w.id, w.code, w.name,
            w.price, w.price_ws,
            round((price - price*".$so_discount."/100),2) as so_price,
            round((price_ws - price_ws*".$so_discount."/100),2) as so_price_ws,
            wi.image_id, wi.extension as ext,
            if(@wid=w.id,@rownum+1,1) as rank, @wid:=w.id				
        from ware_tbl w
        join (SELECT @rownum:=1, @wid:=0) r
        left join ware_image_tbl wim on w.id = wim.ware_id and wim.is_main = 1
        left join ware_image_tbl wi on w.id = wi.ware_id and ( (wim.is_main = 1 and wi.is_main=1) or (wim.is_main is null and if(@wid=w.id,@rownum+1,1)=1) )
        where 1=1            
        and w.isactive=1 and w.isspecoffer=1 and w.isinstok = 1
        order by RAND()
        limit ".$num_hit."
        ";

        $dt_so = $utils->GetAssocArray($query);

    //get hits
    $query = "
        select 
            w.id, w.code, w.name,
            if(w.isspecoffer, round((w.price - w.price*".$so_discount."/100),2), w.price) as price,
            if(w.isspecoffer, round((w.price_ws - w.price_ws*".$so_discount."/100),2), w.price_ws) so_price_ws,
            wi.image_id, wi.extension as ext,
            if(@wid=w.id,@rownum+1,1) as rank, @wid:=w.id				
        from ware_tbl w
        join order_ware_tbl wo ON w.id = wo.wareid 
        join (SELECT @rownum:=1, @wid:=0) r
        left join ware_image_tbl wim on w.id = wim.ware_id and wim.is_main = 1
        left join ware_image_tbl wi on w.id = wi.ware_id and ( (wim.is_main = 1 and wi.is_main=1) or (wim.is_main is null and if(@wid=w.id,@rownum+1,1)=1) )
        where 1=1            
        and w.isactive=1
        group by w.id
        order by count(wo.orderid) desc, RAND()            
        limit ".$num_hit."
        ";
    $dt_hit1 = $utils->GetAssocArray($query);
    $dt_hit2 = array();
    if(count($dt_hit1)<$num_hit){
        $num_hit = $num_hit - count($dt_hit1);
        $query = "
            select 
                w.id, w.code, w.name,
                if(w.isspecoffer, round((w.price - w.price*".$so_discount."/100),2), w.price) as price,
                if(w.isspecoffer, round((w.price_ws - w.price_ws*".$so_discount."/100),2), w.price_ws) so_price_ws,
                wi.image_id, wi.extension as ext,
                if(@wid=w.id,@rownum+1,1) as rank, @wid:=w.id				
            from ware_tbl w
            join (
                select id from ware_tbl order by creationdate desc limit 30
            ) w_last on w.id = w_last.id
            join (SELECT @rownum:=1, @wid:=0) r
            left join ware_image_tbl wim on w.id = wim.ware_id and wim.is_main = 1
            left join ware_image_tbl wi on w.id = wi.ware_id and ( (wim.is_main = 1 and wi.is_main=1) or (wim.is_main is null and if(@wid=w.id,@rownum+1,1)=1) )
            where 1=1            
            and w.isactive=1
            order by RAND()
            limit ".$num_hit."                
        ";
        $dt_hit2 = $utils->GetAssocArray($query);            
    }
    $dt_hit = $dt_hit1+$dt_hit2;
    
    $query = "select banner_id, imgfile, position, page, ware_id from banners_tbl";
    $dt_b = $utils->GetAssocArray($query);
        
    $smarty->assign(array(
            "dt_so"	=> $dt_so,
            "dt_hit" 	=> $dt_hit,
            "dt_b" 	=> $dt_b
    ));
}  

function getdata_WareList($open_id){
    global $ufunc,$smarty,$utils;

    $p=$utils->getRequestParams("page,f_size,f_price_min,f_price_max,f_search","1,empty,0,0,empty");
    $p["open_id"] = $open_id;
    $where = array();    
    if(in_array($open_id,array("new","search"))){
        $open_id = 0;
        if($p["open_id"]=="new"){
            $where[] = " AND (w.creationdate >= date_add(date(now()), interval -1 month) and w.creationdate<= date_add(date(now()), interval 1 month))";
        }        
        if($p["open_id"]=="search"){
            if(strlen($p["f_search"])>3){
                $swords = explode(' ', $p["f_search"]);
                $w_or = array();
                foreach($swords as $sw){
                    $w_or[] = "(w.name like '%".$sw."%' OR w.body = '%".$sw."%' OR w.keywords='%".$sw."%')";                    
                }
                $where[] = " AND (".implode(' OR ', $w_or).")";
            }else{
                $where[] = " AND w.name = '".$p["f_search"]."' OR w.body = '".$p["f_search"]."' OR w.keywords like ',".$p["f_search"].",'";
            }
        }                
    }

    $so_discount = $ufunc->getSODiscount();    
    $_perpage= $utils->get_pageattribute("ware_on_page"); 
    //var_dump(1);    
    if($open_id>0){
        $c_path = array();          
        $c_path = $utils->getSubs($open_id,"category_tbl",$c_path);  
    }    
    if(count($c_path)==0){ $c_path[] = 0; }
    
    //var_dump(2);
    $fs = array();
    $fs["price"] = $ufunc->getCatMinMaxPrice($p["open_id"],$c_path,$so_discount,$where);   
    
    $p["f_price_min"] = $p["f_price_min"]==0 || $p["f_price_min"]<$fs["price"]["PRICE_MIN"] ? $fs["price"]["PRICE_MIN"] : $p["f_price_min"];
    $p["f_price_max"] = $p["f_price_max"]==0 || $p["f_price_max"]>$fs["price"]["PRICE_MAX"] ? $fs["price"]["PRICE_MAX"] : $p["f_price_max"];    
    
    //FILTERS
    $where[] = " 
            AND ( 
            if(w.isspecoffer, round((w.price - w.price*".$so_discount."/100),2), w.price)>=".$p["f_price_min"]." AND
            if(w.isspecoffer, round((w.price - w.price*".$so_discount."/100),2), w.price)<=".$p["f_price_max"]."    
            )";
    if(strlen($p["f_size"])>0){
        $where[] = " AND (wsz.size_id IN (".$p["f_size"]."))";
    }
    
    //var_dump(3);    
    $query = "
        select 
            w.id, w.code, w.name,
            w.price, w.price_ws,
            round((price - price*".$so_discount."/100),2) as so_price,
            round((price_ws - price_ws*".$so_discount."/100),2) as so_price_ws,
            w.isspecoffer as isso,
            wi.image_id, wi.extension as ext,
            if(@wid=w.id,@rownum+1,1) as rank, @wid:=w.id				
        from ware_tbl w        
        join (SELECT @rownum:=1, @wid:=0) r
        join ware_category_tbl wc on w.id = wc.wareid and ( ".$open_id."=0 OR wc.categoryid IN (".implode(',',$c_path).") )
        left join ware_image_tbl wim on w.id = wim.ware_id and wim.is_main = 1
        left join ware_image_tbl wi on w.id = wi.ware_id and ( (wim.is_main = 1 and wi.is_main=1) or (wim.is_main is null and if(@wid=w.id,@rownum+1,1)=1) )
        left join ware_sizetype_size_tbl wsz on w.id = wsz.ware_id
        where 1=1       
        and w.isactive=1
        ".implode(' ',$where)."
        group by w.id
        order by creationdate desc          
        ";
    
    if(isset($limit)){ $query.=$limit; }
    
//var_dump($query);
    $ds = $utils->GetAssocArray_Pager($query,$_perpage,$p["page"]);     
    $smarty->assign(array(
        "p"     => $p,
        "dt"	=> $ds["dt"],
        "pager" => $ds["pager"],
        "dr_c"  => $this->getCatInfo($p["open_id"]),
        "dt_sz" => $this->getSizes(),
        "fs"    => $fs
    ));     
}

function getdata_WareView($ware_id){
    global $smarty, $utils;
    
    //get parameters
    $p=$utils->getRequestParams("open_id,page,f_size,f_price_min,f_price_max,fromware,f_search","0,1,empty,0,0,0,empty");

    //settings
    $so_discount = $this->getSODiscount();    
    
    //get filter sources
    $fs = array();
    $fs["dt_szt"] = $this->getSizeTypes();
    
    //get ware info
    $query = "
        select 
            w.id, w.code, w.name, w.body,
            w.price, w.price_ws,
            round((price - price*".$so_discount."/100),2) as so_price,
            round((price_ws - price_ws*".$so_discount."/100),2) as so_price_ws,
            w.isspecoffer as isso,
            w.keywords, w.isinstok,
            wi.image_id, wi.extension as ext,
            if(@wid=w.id,@rownum+1,1) as rank, @wid:=w.id
        from ware_tbl w        
        join (SELECT @rownum:=1, @wid:=0) r
        left join ware_image_tbl wim on w.id = wim.ware_id and wim.is_main = 1
        left join ware_image_tbl wi on w.id = wi.ware_id and ( (wim.is_main = 1 and wi.is_main=1) or (wim.is_main is null and if(@wid=w.id,@rownum+1,1)=1) )
        where 1=1       
        and w.id=".$ware_id."
        group by w.id
        ";
    $dt = $utils->GetAssocArray($query);
    $dr = count($dt)>0 ? $dt[0] : false;
    
    //get ware images
    $dt_wi = $this->get_WareImages($ware_id,$dr["IMAGE_ID"]);
    
    //get ware sizes
    $dt_wsz = $this->get_WareSizes_Ext($ware_id);
    //var_dump($dt_wsz);
    
    //get joint
    $dt_wj = $this->get_WareJoint($ware_id,$so_discount);
            
    $smarty->assign("fancybox",true);
    $smarty->assign(array(
        "p"         => $p,
        "fs"        => $fs,
        "dr"        => $dr,
        "dt_wi"     => $dt_wi,
        "dt_wsz"    => $dt_wsz,
        "dt_wj"     => $dt_wj
    ));
}

function orderConfirm(){   
    global $dbconn, $utils, $config, $smarty;
    
    $p=$utils->getRequestParams("f_firstname,f_surname,f_fathername,f_emailaddress,f_phone,f_paymenttypeid,f_postalcode,f_region,f_city,f_street,f_comments","empty,empty,empty,empty,empty,0,empty,empty,empty,empty");    
    $cart = $this->getCart();
    
    if(count($p)>0 && count($cart["items"])>0){
        //insert order_tbl
        $fkey = array(); $fval=array();
        foreach($p as $key=>$val){
            if(strlen($val)>0){
                $fkey[] = str_replace("f_","",$key);
                $fval[] = $val;
            }
        }
        $ordersum = $this->getSumLimit($cart["summary"]["discount"]);
        $ordersum_discount = strval($cart["summary"]["discount"]).'|'.strval($ordersum);
        $query = "
            insert into order_tbl (".implode(',',$fkey).",ordersum_discount,postalcost,creationdate)
            values ('".implode("','",$fval)."','".$ordersum_discount."',".$cart["summary"]["postalcost"].",NOW())
            ";   
        //$utils->varsexporttofile(array($query));
        $dbconn->Execute($query);    
        $order_id = $dbconn->Insert_ID();

        //insert order_ware_tbl
        $so_discount = $this->getSODiscount();
        $ins_ware = array();
        foreach($cart["items"] as $item_id=>$item){
            $so_discount0 = $item["price0"] != $item["price"] ? $so_discount : 0;
            $ins_ware[] = "($order_id,".$item["ware_id"].",".$item["qty"].",".$item["price0"].",$so_discount0,".$item["sizetype_id"].",".$item["size_id"].")";
        }

        $query = "
            insert into order_ware_tbl (orderid,wareid,amount,price,discount,sizetype_id,size_id)
            values ".implode(',',$ins_ware)."
            ";
        $dbconn->Execute($query);

        //send order confirmation email to customer
        $p["order_id"]=$order_id;
        $smarty->assign(array(
            "dr_o"=>$p,
            "cart"=>$cart,
            "dr_pt"=>$this->getPaymentTypeById($p["f_paymenttypeid"])
        ));
        $to = $p["f_emailaddress"];
        $subject = $config["site_name"]." Подтверждение заказа #".$order_id;
        $body = $smarty->fetch("user_order_email_notification.tpl");        
        $this->sendMail($to,$subject,$body);
        
        $cart = $this->clearCart();
    }
}
function sendMail($to,$subject,$body){
    global $config;
    
    $headers   = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/html; charset=windows-1251";
    $headers[] = "From: ".$config["email_notification_caption"]." <".$config["from_email"].">";
    $headers[] = "Reply-To: ".$config["email_notification_caption"]." <".$config["from_email"].">";
    $headers[] = "Subject: ".$subject;
    $headers[] = "X-Mailer: PHP/".phpversion();

    mail($to, $subject, $body, implode("\r\n", $headers));    
}

///end class
}
?>