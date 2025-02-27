---
title: Channel Deepdive
---
###  A closer look at the Marketing Channels and their relation to sales.
<Details title='How to edit this page'>

  This page can be found in your project at `/pages/channel.md`. Make a change to the markdown file and save it to see the change take effect in your browser.
</Details>

```sql channel_table
select channel, category, item, round(avg(sales), 2) as avg_sales
FROM orders
group by channel, category, item
order BY channel, category;
```
<Dropdown data={channel_table} name=channel value=channel>
    <DropdownOption value="%" valueLabel="All Channels"/>
</Dropdown>


## Channel to Sale path - Category
<SankeyDiagram 
    data={channel_table} 
    sourceCol= channel
    targetCol = category
    valueCol= avg_sales
/>

### Takeaway
Each Marketing Channel feeds into sales of each category with remarkably even distribution. There's no trend to suggest that certain channels contribute to any specific sales. The number of referals is also strikingly similar across channels, with each channel contributing with aproximately 500 closed sales (498.7-501.3). If I didn't know better I'd almost believe these figures were manufactured.

## Channel to Sale path - Item and Category
```sql categories
  select
      category
  from needful_things.orders
  group by category
```
<Dropdown data={categories} name=category value=category>
    <DropdownOption value="%" valueLabel="All Categories"/>
</Dropdown>

```sql channel_table_item
select channel, category, item, round(avg(sales), 2) as avg_sales
FROM orders
where category like '${inputs.category.value}'
group by channel, category, item
order BY channel, category;
```

<SankeyDiagram 
    data={channel_table_item} 
    sourceCol= channel
    targetCol = item
    valueCol= avg_sales
/>

### Takeaway
The best selling items gain the most leads from the marketing channels, but theres is nothing to suggest that certain channels prefer certain items or that certain channels result in greater sales. The lack of trend is disturbing.

