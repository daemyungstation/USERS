/*     */ package emf.core.adapter.data;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.Collection;
/*     */ import java.util.HashMap;
/*     */ import java.util.HashSet;
/*     */ import java.util.Iterator;
/*     */ import java.util.Map;
/*     */ import java.util.Set;
/*     */ 
/*     */ public class EmfIHashMap
/*     */   implements Map, Serializable
/*     */ {
/*     */   private static final long serialVersionUID = 4268511433216020229L;
/*  36 */   private Map hmap = null;
/*     */ 
/*  38 */   private HashSet keySet = null;
/*     */ 
/*     */   public EmfIHashMap()
/*     */   {
/*  44 */     this.hmap = new HashMap();
/*  45 */     this.keySet = new HashSet();
/*     */   }
/*     */ 
/*     */   public EmfIHashMap(int initialCapacity)
/*     */   {
/*  54 */     this.hmap = new HashMap(initialCapacity);
/*  55 */     this.keySet = new HashSet(initialCapacity);
/*     */   }
/*     */ 
/*     */   public EmfIHashMap(int initialCapacity, float loadFactor) {
/*  59 */     this.hmap = new HashMap(initialCapacity, loadFactor);
/*  60 */     this.keySet = new HashSet(initialCapacity, loadFactor);
/*     */   }
/*     */ 
/*     */   public void clear()
/*     */   {
/*  67 */     this.hmap.clear();
/*  68 */     this.keySet = new HashSet();
/*     */   }
/*     */ 
/*     */   public boolean containsKey(Object key)
/*     */   {
/*  75 */     return this.hmap.containsKey(upper(key));
/*     */   }
/*     */ 
/*     */   public boolean containsValue(Object value)
/*     */   {
/*  83 */     return this.hmap.containsValue(value);
/*     */   }
/*     */ 
/*     */   public Set entrySet()
/*     */   {
/*  90 */     return this.hmap.entrySet();
/*     */   }
/*     */ 
/*     */   public Object get(Object key)
/*     */   {
/*  97 */     return this.hmap.get(upper(key));
/*     */   }
/*     */ 
/*     */   public boolean isEmpty()
/*     */   {
/* 104 */     return this.hmap.isEmpty();
/*     */   }
/*     */ 
/*     */   public Set keySet()
/*     */   {
/* 111 */     return this.keySet;
/*     */   }
/*     */ 
/*     */   public Object put(Object key, Object value)
/*     */   {
/* 118 */     Object obj = this.hmap.put(upper(key), value);
/* 119 */     this.keySet.add(key);
/* 120 */     return obj;
/*     */   }
/*     */ 
/*     */   public void putAll(Map t)
/*     */   {
/* 127 */     this.hmap.putAll(t);
/*     */   }
/*     */ 
/*     */   public Object remove(Object key)
/*     */   {
/* 134 */     Object obj = this.hmap.remove(upper(key));
/* 135 */     if (key == null) {
/* 136 */       this.keySet.remove(key);
/* 137 */     } else if ((key instanceof String)) {
/* 138 */       Iterator it = this.keySet.iterator();
/* 139 */       while (it.hasNext()) {
/* 140 */         Object each = it.next();
/* 141 */         if (((each instanceof String)) && 
/* 142 */           (((String)key).equalsIgnoreCase((String)each))) {
/* 143 */           this.keySet.remove(each);
/* 144 */           break;
/*     */         }
/*     */       }
/*     */     }
/*     */ 
/* 149 */     return obj;
/*     */   }
/*     */ 
/*     */   public int size()
/*     */   {
/* 156 */     return this.hmap.size();
/*     */   }
/*     */ 
/*     */   public Collection<Map> values()
/*     */   {
/* 163 */     return this.hmap.values();
/*     */   }
/*     */ 
/*     */   private Object upper(Object key)
/*     */   {
/* 171 */     if ((key instanceof String)) {
/* 172 */       key = ((String)key).toUpperCase();
/*     */     }
/* 174 */     return key;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 183 */     StringBuffer buf = new StringBuffer();
/* 184 */     buf.append("{");
/*     */ 
/* 186 */     Iterator i = keySet().iterator();
/* 187 */     boolean hasNext = i.hasNext();
/* 188 */     while (hasNext) {
/* 189 */       Object key = i.next();
/* 190 */       Object value = this.hmap.get(key);
/* 191 */       buf.append((key == this ? "(this Map)" : key) + "=" + (value == this ? "(this Map)" : value));
/*     */ 
/* 194 */       hasNext = i.hasNext();
/* 195 */       if (hasNext) {
/* 196 */         buf.append(", ");
/*     */       }
/*     */     }
/* 199 */     buf.append("}");
/* 200 */     return buf.toString();
/*     */   }
/*     */ 
/*     */   public boolean equals(Object obj)
/*     */   {
/* 208 */     if (!(obj instanceof EmfIHashMap)) {
/* 209 */       return false;
/*     */     }
/* 211 */     return this.hmap.equals(((EmfIHashMap)obj).hmap);
/*     */   }
/*     */ }

/* Location:           D:\프로그램\0.1.022\hae_core-0.1.022.jar
 * Qualified Name:     hae.core.adapter.data.HaeCaseIHashMap
 * JD-Core Version:    0.6.2
 */