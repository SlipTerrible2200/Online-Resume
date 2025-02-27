---
title: Category Deepdive
---
###  A closer look at the Categories sold
<Details title='How to edit this page'>

  This page can be found in your project at `/pages/item.md`. Make a change to the markdown file and save it to see the change take effect in your browser.
</Details>

```sql categories
  select
      category
  from needful_things.orders
  group by category
```

<Dropdown data={categories} name=category value=category>
    <DropdownOption value="%" valueLabel="All Categories"/>
</Dropdown>

<Dropdown name=year>
    <DropdownOption value=% valueLabel="All Years"/>
    <DropdownOption value=2019/>
    <DropdownOption value=2020/>
    <DropdownOption value=2021/>
</Dropdown>

# Category
## Sales

```sql Cat_query
select 'Cursed Sporting Goods' as donut, 2156 as count
union all
select 'Mysterious Apparel' as donut, 2593 as count
union all
select 'Odd Equipment' as donut, 2483 as count
union all
select 'Sinister Toys' as donut, 2768 as count
```

```sql Cat_data
select donut as name, count as value
from ${Cat_query}
```

<ECharts config={
    {
        tooltip: {
            formatter: '{b}: {c} ({d}%)'
        },
      series: [
        {
          type: 'pie',
          radius: ['50%', '100%'],
          data: [...Cat_data],
        }
      ]
      }
    }
/>

### Takeaway
The orders are pretty evenly dispersed among the four main categories. Each category reflects roughly a fourth (22-28 %) of the volume of sales.


## Value
```sql cat_value_query
SELECT category, COUNT(sales) as number_of_Units, 
       ROUND(SUM(sales), 2) as val_sales, item
FROM orders
GROUP BY category, item;
```

```sql Cat_value_data
SELECT category, COUNT(sales) as number_of_Units, 
       ROUND(SUM(sales), 2) as val_sales,
       round(val_sales/number_of_Units, 2) as price
FROM orders
GROUP BY category
ORDER BY category, number_of_Units;
```
<BubbleChart 
    data={Cat_value_data}
    x=number_of_Units
    y=price
    yFmt=usd0
    series=category
    size=val_sales
    scaleTo=1.25
/>

### Takeaway
The above bubble chart illustrates how two categories are relatively low-volume but high-value, **_Cursed Sporting Goods_** and **_Odd Equipment_**; while two categories are low-value but high-volume, **_Mysterious Apparel_** and **_Sinister Toys_.**

