package com.zjut.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FlightExample {
	protected String orderByClause;

	protected boolean distinct;

	protected List<Criteria> oredCriteria;

	public FlightExample() {
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

		public Criteria andFlyIdIsNull() {
			addCriterion("fly_id is null");
			return (Criteria) this;
		}

		public Criteria andFlyIdIsNotNull() {
			addCriterion("fly_id is not null");
			return (Criteria) this;
		}

		public Criteria andFlyIdEqualTo(Integer value) {
			addCriterion("fly_id =", value, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdNotEqualTo(Integer value) {
			addCriterion("fly_id <>", value, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdGreaterThan(Integer value) {
			addCriterion("fly_id >", value, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("fly_id >=", value, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdLessThan(Integer value) {
			addCriterion("fly_id <", value, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdLessThanOrEqualTo(Integer value) {
			addCriterion("fly_id <=", value, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdIn(List<Integer> values) {
			addCriterion("fly_id in", values, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdNotIn(List<Integer> values) {
			addCriterion("fly_id not in", values, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdBetween(Integer value1, Integer value2) {
			addCriterion("fly_id between", value1, value2, "flyId");
			return (Criteria) this;
		}

		public Criteria andFlyIdNotBetween(Integer value1, Integer value2) {
			addCriterion("fly_id not between", value1, value2, "flyId");
			return (Criteria) this;
		}

		public Criteria andOriginIsNull() {
			addCriterion("origin is null");
			return (Criteria) this;
		}

		public Criteria andOriginIsNotNull() {
			addCriterion("origin is not null");
			return (Criteria) this;
		}

		public Criteria andOriginEqualTo(String value) {
			addCriterion("origin =", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginNotEqualTo(String value) {
			addCriterion("origin <>", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginGreaterThan(String value) {
			addCriterion("origin >", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginGreaterThanOrEqualTo(String value) {
			addCriterion("origin >=", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginLessThan(String value) {
			addCriterion("origin <", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginLessThanOrEqualTo(String value) {
			addCriterion("origin <=", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginLike(String value) {
			addCriterion("origin like", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginNotLike(String value) {
			addCriterion("origin not like", value, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginIn(List<String> values) {
			addCriterion("origin in", values, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginNotIn(List<String> values) {
			addCriterion("origin not in", values, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginBetween(String value1, String value2) {
			addCriterion("origin between", value1, value2, "origin");
			return (Criteria) this;
		}

		public Criteria andOriginNotBetween(String value1, String value2) {
			addCriterion("origin not between", value1, value2, "origin");
			return (Criteria) this;
		}

		public Criteria andDestinationIsNull() {
			addCriterion("destination is null");
			return (Criteria) this;
		}

		public Criteria andDestinationIsNotNull() {
			addCriterion("destination is not null");
			return (Criteria) this;
		}

		public Criteria andDestinationEqualTo(String value) {
			addCriterion("destination =", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationNotEqualTo(String value) {
			addCriterion("destination <>", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationGreaterThan(String value) {
			addCriterion("destination >", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationGreaterThanOrEqualTo(String value) {
			addCriterion("destination >=", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationLessThan(String value) {
			addCriterion("destination <", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationLessThanOrEqualTo(String value) {
			addCriterion("destination <=", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationLike(String value) {
			addCriterion("destination like", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationNotLike(String value) {
			addCriterion("destination not like", value, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationIn(List<String> values) {
			addCriterion("destination in", values, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationNotIn(List<String> values) {
			addCriterion("destination not in", values, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationBetween(String value1, String value2) {
			addCriterion("destination between", value1, value2, "destination");
			return (Criteria) this;
		}

		public Criteria andDestinationNotBetween(String value1, String value2) {
			addCriterion("destination not between", value1, value2, "destination");
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

		public Criteria andPriceIsNull() {
			addCriterion("price is null");
			return (Criteria) this;
		}

		public Criteria andPriceIsNotNull() {
			addCriterion("price is not null");
			return (Criteria) this;
		}

		public Criteria andPriceEqualTo(Integer value) {
			addCriterion("price =", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceNotEqualTo(Integer value) {
			addCriterion("price <>", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceGreaterThan(Integer value) {
			addCriterion("price >", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceGreaterThanOrEqualTo(Integer value) {
			addCriterion("price >=", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceLessThan(Integer value) {
			addCriterion("price <", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceLessThanOrEqualTo(Integer value) {
			addCriterion("price <=", value, "price");
			return (Criteria) this;
		}

		public Criteria andPriceIn(List<Integer> values) {
			addCriterion("price in", values, "price");
			return (Criteria) this;
		}

		public Criteria andPriceNotIn(List<Integer> values) {
			addCriterion("price not in", values, "price");
			return (Criteria) this;
		}

		public Criteria andPriceBetween(Integer value1, Integer value2) {
			addCriterion("price between", value1, value2, "price");
			return (Criteria) this;
		}

		public Criteria andPriceNotBetween(Integer value1, Integer value2) {
			addCriterion("price not between", value1, value2, "price");
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