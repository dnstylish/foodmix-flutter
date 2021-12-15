import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecipeStepperView extends ViewModelWidget<RecipeViewModel> {
  const RecipeStepperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return VisibilityDetector(
      key: const Key('stepper'),
      onVisibilityChanged: (VisibilityInfo info) => viewModel.setCurrentView(info, 1),
      child: Column(
        key: viewModel.stepperKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cách Làm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          Stack(
            children: [
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 25,
                  child: Container(
                    width: 2,
                    height: double.infinity,
                    color: const Color(0xFF6366f1),
                  )),
              Column(
                children: viewModel.recipe.stepper
                    .asMap()
                    .map((index, stepper) => MapEntry(
                        index,
                        _StepperItem(
                            stepper: stepper,
                            index: index,
                            count: viewModel.recipe.stepper.length)))
                    .values
                    .toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _StepperItem extends StatelessWidget {
  const _StepperItem(
      {Key? key,
      required this.index,
      required this.stepper,
      required this.count})
      : super(key: key);

  final int index;
  final RecipeStepper stepper;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFF6366f1),
              borderRadius: BorderRadius.circular(50)),
          width: 50,
          height: 50,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF6366f1),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 2)),
              width: 45,
              height: 45,
              child: Center(
                child: Text('${index + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15)),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Bước ${index + 1}', style: const TextStyle(fontSize: 18)),

              const SizedBox(
                height: 10,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stepper.content),
                  (() => stepper.image.isNotEmpty ? _StepperContent(stepper: stepper) : Container())(),

                  (() => index < count - 1 ? const Divider(height: 30) : Container())()
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}

class _StepperContent extends StatelessWidget {
  const _StepperContent({
    Key? key,
    required this.stepper,
  }) : super(key: key);

  final RecipeStepper stepper;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(imageUrl: stepper.image)
        )
    );
  }
}
