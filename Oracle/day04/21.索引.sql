/**
面试:
如何优化你的数据库查询?
1.数据库的查询方式?
  -- 全表扫描  select * from tb_student   慢
  -- 利用索引扫描       快
  -- 共享语句       最快(oralce有个回滚段，临时表空间)
  select * from tb_student;

索引 index
作用: 在数据库中用来加速对表的查询
原理: 通过使用快速路径访问方法快速定位数据,减少了磁盘的I/O
特点:
与表独立存放，但不能独立存在，必须属于某个表
由数据库自动维护，表被删除时，该表上的索引自动被删除。

索引的创建:
自动: 当在表上定义一个PRIMARY KEY 或者UNIQUE 约束条件时, 数据库自动创建一个对应的索引.
手动: 用户可以创建索引以加速查询.

当创建索引的时候，Oracle会默认创建一个和当前表相关的索引页,而索引页中保存了索引字段和真实的磁盘地址，
当用户发送sql语句带了索引的时候，Oracle会到索引页中查询索引字段，直接定位磁盘IO，提取数据。
所以索引数据快于全表扫描。

索引的维护
1.建立索引后，查询的时候需要在where条件中带索引的字段才可以使用索引。
2.在经常查询的字段上面建立索引。不要在所有字段上面建立索引。
3.因为索引是用来加快查询速度的，如果一张表经常做insert、delete、update，
而很少做select,不建议建立索引，因为Oracle需要对索引进行额外的维护
如果一张表字段很少，不建议建立索引。
4.索引是由Oracle自动维护的。索引使用久了会产生索引碎片（磁盘碎片），
影响查询效果，所以使用久了需要手动进行维护(删除再重建)。
*/
SELECT * FROM tb_student;

--在tb_student表的name字段上面建立了一个索引
--创建  索引  索引名           on  表 (字段)
CREATE  INDEX  i_tb_student_name ON  tb_student (name);

--查询的时候使用索引(where条件使用建立了索引的字段)
select * from tb_student where name = 'Alice';

--删除索引
DROP INDEX i_tb_student_name;

/*
sql语句的优化：
多使用共享语句 尽量使你的sql语句能够使用索引。
怎样使sql语句能够使用到索引呢：
当sql语句中包含not in,<>,is null,is not null,like '%%'的时候不会用索引。
IN: in会拆成一堆or的,可以使用表的索引。
NOT IN:强列推荐不使用，因为它不能应用表的索引。
<> 操作符（不等于）: 不等于操作符是永远不会用到索引的，因此对它的处理只会产生全表扫描。
优化方案:用其它相同功能的操作运算代替，如a<>0 改为 a>0 or a<0;a<>’’ 改为 a>’’.
IS NULL 或IS NOT NULL操作（判断字段是否为空）:
判断字段是否为空一般是不会应用索引的，因为B树索引(oracle大多是使用B树索引)是不索引空值的。
优化方案:用其它相同功能的操作运算代替，如 a is not null 改为 a>0 或a>’’等。
is null 时，用一个缺省值代替空值，例如业务申请中状态字段不允许为空，缺省为申请。
LIKE：LIKE操作符可以应用通配符查询，里面的通配符组合可能达到几乎是任意的查询，
但是如果用得不好则会产生性能上的问题，
优化方案:如LIKE ‘%001%’ 这种查询不会引用索引，会产生全表扫描，
而LIKE ‘001%’则会引用范围索引。进行范围的查询，性能肯定大大提高。
*/

CREATE TABLE emp(
comm INT DEFAULT 0,
status VARCHAR2(18) DEFAULT '申请'
);

CREATE TABLE tb_emp(
emial VARCHAR2(50) DEFAULT 'aaa'
);
SELECT * FROM tb_emp WHERE email IS NULL --不使用index
SELECT * FROM tb_emp WHERE email = 'aaa' --使用index


