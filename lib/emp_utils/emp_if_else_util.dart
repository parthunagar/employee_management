Type ifelse<Type>(
  bool condition, {
  required Type valid,
  required Type invalid,
}) {
  return condition ? valid : invalid;
}

Type ifelseObject<Type, Obj>({
  required Obj object,
  required bool Function(Obj) condition,
  required Type Function(Obj) valid,
  required Type Function(Obj) invalid,
}) {
  return condition(object) ? valid(object) : invalid(object);
}

Type conditionalValue<Type, Obj>({
  required Obj value,
  required Type Function(Obj) conditions,
}) {
  return conditions(value);
}

class Conditional {

  static Type ifelse<Type>(
    bool condition, {
    required Type valid,
    required Type invalid,
  }) {
    return condition ? valid : invalid;
  }

  static Type ifelseObject<Type, Obj>({
    required bool Function(Obj?) condition,
    required Type Function(Obj?) valid,
    required Type Function(Obj?) invalid,
    Obj? object,
  }) {
    return condition(object) ? valid(object) : invalid(object);
  }

  static Type custom<Type, Obj>({
    required Obj value,
    required Type Function(Obj) conditions,
  }) {
    return conditions(value);
  }
  static V switchCase<V, K>({
    required K value,
    required Map<K, V> cases,
    required V defaultValue,
  }) {
    return cases[value] ?? defaultValue;
  }
}
