WITH cte AS (
SELECT  table_name, column_name, data_type, data_length  , nullable ,
		--這裡在 mapping c# 資料型別
         case utc.data_type
            when 'DATE' then 'DateTime'
            when 'VARCHAR2' then 'string'
            when 'CLOB' then 'string'
            when 'NUMBER' then
              case when utc.data_scale=0 then
                case
                  when utc.data_precision = 19 then 'long'
                  when utc.data_precision = 9 then 'int'
                  when utc.data_precision = 4 then 'int'
                  when utc.data_precision = 1 then 'Boolean'
                  else 'int'|| utc.data_precision  end
              else 'decimal' end
            when 'CHAR' then
              case when utc.data_length = 1 then 'char'
              else 'string' end
            else '' end as clr_data_type

FROM all_tab_columns utc

)
SELECT 'public ' || clr_data_type ||
    --判斷是否為 null 型別
    case when clr_data_type = 'string' then ''
    else
        case when nullable = 'Y' then '?'
        else '' end
    end
    || ' ' || COLUMN_NAME || ' { get;set; }' as prop
FROM cte
WHERE table_name = 'YOURVIEW'
