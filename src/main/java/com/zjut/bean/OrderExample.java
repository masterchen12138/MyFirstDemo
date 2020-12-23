package com.zjut.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderExample {
	protected String orderByClause;

	protected boolean distinct;

	protected List<Criteria> oredCriteria;

	public OrderExample() {
		oredCriteria = new ArrayList<>();
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public String getOrderByClause() {
		return orderByClause;
	}

	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	public boolean isDistinct() {
		return distinct;
	}

	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andOrdIdIsNull() {
			addCriterion("ord_id is null");
			return (Criteria) this;
		}

		public Criteria andOrdIdIsNotNull() {
			addCriterion("ord_id is not null");
			return (Criteria) this;
		}

		public Criteria andOrdIdEqualTo(Integer value) {
			addCriterion("ord_id =", value, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdNotEqualTo(Integer value) {
			addCriterion("ord_id <>", value, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdGreaterThan(Integer value) {
			addCriterion("ord_id >", value, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("ord_id >=", value, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdLessThan(Integer value) {
			addCriterion("ord_id <", value, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdLessThanOrEqualTo(Integer value) {
			addCriterion("ord_id <=", value, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdIn(List<Integer> values) {
			addCriterion("ord_id in", values, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdNotIn(List<Integer> values) {
			addCriterion("ord_id not in", values, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdBetween(Integer value1, Integer value2) {
			addCriterion("ord_id between", value1, value2, "ordId");
			return (Criteria) this;
		}

		public Criteria andOrdIdNotBetween(Integer value1, Integer value2) {
			addCriterion("ord_id not between", value1, value2, "ordId");
			return (Criteria) this;
		}

		public Criteria andUIdIsNull() {
			addCriterion("u_id is null");
			return (Criteria) this;
		}

		public Criteria andUIdIsNotNull() {
			addCriterion("u_id is not null");
			return (Criteria) this;
		}

		public Criteria andUIdEqualTo(Integer value) {
			addCriterion("u_id =", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdNotEqualTo(Integer value) {
			addCriterion("u_id <>", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdGreaterThan(Integer value) {
			addCriterion("u_id >", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("u_id >=", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdLessThan(Integer value) {
			addCriterion("u_id <", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdLessThanOrEqualTo(Integer value) {
			addCriterion("u_id <=", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdIn(List<Integer> values) {
			addCriterion("u_id in", values, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdNotIn(List<Integer> values) {
			addCriterion("u_id not in", values, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdBetween(Integer value1, Integer value2) {
			addCriterion("u_id between", value1, value2, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdNotBetween(Integer value1, Integer value2) {
			addCriterion("u_id not between", value1, value2, "uId");
			return (Criteria) this;
		}

		public Criteria andFIdIsNull() {
			addCriterion("f_id is null");
			return (Criteria) this;
		}

		public Criteria andFIdIsNotNull() {
			addCriterion("f_id is not null");
			return (Criteria) this;
		}

		public Criteria andFIdEqualTo(Integer value) {
			addCriterion("f_id =", value, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdNotEqualTo(Integer value) {
			addCriterion("f_id <>", value, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdGreaterThan(Integer value) {
			addCriterion("f_id >", value, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("f_id >=", value, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdLessThan(Integer value) {
			addCriterion("f_id <", value, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdLessThanOrEqualTo(Integer value) {
			addCriterion("f_id <=", value, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdIn(List<Integer> values) {
			addCriterion("f_id in", values, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdNotIn(List<Integer> values) {
			addCriterion("f_id not in", values, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdBetween(Integer value1, Integer value2) {
			addCriterion("f_id between", value1, value2, "fId");
			return (Criteria) this;
		}

		public Criteria andFIdNotBetween(Integer value1, Integer value2) {
			addCriterion("f_id not between", value1, value2, "fId");
			return (Criteria) this;
		}

		public Criteria andTimeIsNull() {
			addCriterion("time is null");
			return (Criteria) this;
		}

		public Criteria andTimeIsNotNull() {
			addCriterion("time is not null");
			return (Criteria) this;
		}

		public Criteria andTimeEqualTo(Date value) {
			addCriterion("time =", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeNotEqualTo(Date value) {
			addCriterion("time <>", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeGreaterThan(Date value) {
			addCriterion("time >", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeGreaterThanOrEqualTo(Date value) {
			addCriterion("time >=", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeLessThan(Date value) {
			addCriterion("time <", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeLessThanOrEqualTo(Date value) {
			addCriterion("time <=", value, "time");
			return (Criteria) this;
		}

		public Criteria andTimeIn(List<Date> values) {
			addCriterion("time in", values, "time");
			return (Criteria) this;
		}

		public Criteria andTimeNotIn(List<Date> values) {
			addCriterion("time not in", values, "time");
			return (Criteria) this;
		}

		public Criteria andTimeBetween(Date value1, Date value2) {
			addCriterion("time between", value1, value2, "time");
			return (Criteria) this;
		}

		public Criteria andTimeNotBetween(Date value1, Date value2) {
			addCriterion("time not between", value1, value2, "time");
			return (Criteria) this;
		}

		public Criteria andCIdIsNull() {
			addCriterion("c_id is null");
			return (Criteria) this;
		}

		public Criteria andCIdIsNotNull() {
			addCriterion("c_id is not null");
			return (Criteria) this;
		}

		public Criteria andCIdEqualTo(Integer value) {
			addCriterion("c_id =", value, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdNotEqualTo(Integer value) {
			addCriterion("c_id <>", value, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdGreaterThan(Integer value) {
			addCriterion("c_id >", value, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("c_id >=", value, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdLessThan(Integer value) {
			addCriterion("c_id <", value, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdLessThanOrEqualTo(Integer value) {
			addCriterion("c_id <=", value, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdIn(List<Integer> values) {
			addCriterion("c_id in", values, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdNotIn(List<Integer> values) {
			addCriterion("c_id not in", values, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdBetween(Integer value1, Integer value2) {
			addCriterion("c_id between", value1, value2, "cId");
			return (Criteria) this;
		}

		public Criteria andCIdNotBetween(Integer value1, Integer value2) {
			addCriterion("c_id not between", value1, value2, "cId");
			return (Criteria) this;
		}

		public Criteria andMoneyIsNull() {
			addCriterion("money is null");
			return (Criteria) this;
		}

		public Criteria andMoneyIsNotNull() {
			addCriterion("money is not null");
			return (Criteria) this;
		}

		public Criteria andMoneyEqualTo(Integer value) {
			addCriterion("money =", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyNotEqualTo(Integer value) {
			addCriterion("money <>", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyGreaterThan(Integer value) {
			addCriterion("money >", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyGreaterThanOrEqualTo(Integer value) {
			addCriterion("money >=", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyLessThan(Integer value) {
			addCriterion("money <", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyLessThanOrEqualTo(Integer value) {
			addCriterion("money <=", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyIn(List<Integer> values) {
			addCriterion("money in", values, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyNotIn(List<Integer> values) {
			addCriterion("money not in", values, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyBetween(Integer value1, Integer value2) {
			addCriterion("money between", value1, value2, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyNotBetween(Integer value1, Integer value2) {
			addCriterion("money not between", value1, value2, "money");
			return (Criteria) this;
		}
	}

	public static class Criteria extends GeneratedCriteria {
		protected Criteria() {
			super();
		}
	}

	public static class Criterion {
		private String condition;

		private Object value;

		private Object secondValue;

		private boolean noValue;

		private boolean singleValue;

		private boolean betweenValue;

		private boolean listValue;

		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}
}