class RecipeState {
    final Map<String, dynamic> runData;
    final bool bill_of_materials_completed;
    final bool step1_completed;
    final bool step2_completed;
    final bool step3_completed;
    final bool step4_completed;
    final bool step5_completed;
    final bool step6_completed;
    final bool step7_completed;
    final bool step8_completed;
    final bool step9_completed;
    final bool step10_completed;
    final bool step11_completed;
    final bool step12_completed;
    final bool step13_completed;
    final bool step14_completed;
    final bool step15_completed;
    final bool step16_completed;
    final bool submitted;
    // Add more fields for other steps as needed

  RecipeState({
    this.runData = const {},
    this.bill_of_materials_completed = false,
    this.step1_completed = false,
    this.step2_completed = false,
    this.step3_completed = false,
    this.step4_completed = false,
    this.step5_completed = false,
    this.step6_completed = false,
    this.step7_completed = false,
    this.step8_completed = false,
    this.step9_completed = false,
    this.step10_completed = false,
    this.step11_completed = false,
    this.step12_completed = false,
    this.step13_completed = false,
    this.step14_completed = false,
    this.step15_completed = false,
    this.step16_completed = false,
    this.submitted = false,
  });

  RecipeState copyWith({
    Map<String, dynamic>? runData,
    bool? bill_of_materials_completed,
    bool? step1_completed,
    bool? step2_completed,
    bool? step3_completed,
    bool? step4_completed,
    bool? step5_completed,
    bool? step6_completed,
    bool? step7_completed,
    bool? step8_completed,
    bool? step9_completed,
    bool? step10_completed,
    bool? step11_completed,
    bool? step12_completed,
    bool? step13_completed,
    bool? step14_completed,
    bool? step15_completed,
    bool? step16_completed,
    bool? submitted,
  })  {
    return RecipeState(
        runData: runData ?? this.runDdata,
        bill_of_materials_completed: bill_of_materials_completed ?? this.bill_of_materials_completed,
        step1_completed: step1_completed ?? this.step1_completed,
        step2_completed: step2_completed ?? this.step2_completed,
        step3_completed: step3_completed ?? this.step3_completed,
        step4_completed: step4_completed ?? this.step4_completed,
        step5_completed: step5_completed ?? this.step5_completed,
        step6_completed: step6_completed ?? this.step6_completed,
        step7_completed: step7_completed ?? this.step7_completed,
        step8_completed: step8_completed ?? this.step8_completed,
        step9_completed: step9_completed ?? this.step9_completed,
        step10_completed: step10_completed ?? this.step10_completed,
        step11_completed: step11_completed ?? this.step11_completed,
        step12_completed: step12_completed ?? this.step12_completed,
        step13_completed: step13_completed ?? this.step13_completed,
        step14_completed: step14_completed ?? this.step14_completed,
        step15_completed: step15_completed ?? this.step15_completed,
        step16_completed: step16_completed ?? this.step16_completed,
        submitted: submitted ?? this.submitted,

      // Copy other step data
    );
  }
}