# Bone Fracture Detector — macOS SwiftUI Demo

<p align="center">
 <img src="https://github.com/user-attachments/assets/13a18ae7-d191-4aab-9718-5330e88f6455" width="800" alt="Bone Fracture Detection" />
</p>

---

> **Disclaimer:** This project is for **educational and research purposes only**. It must **not** be used for real medical diagnosis.

---


A simple macOS demo app built with **SwiftUI** using a **Core ML image classification model** to detect bone fractures from X‑ray images.

I used a publicly available dataset from Kaggle, formatted it for Core ML training, then converted it into `.mlmodel` format.

Dataset format used for Create ML / Core ML training:

```
train/
 ├─ shoulderfracture/
 │   └─ images...
 └─ forearmfracture/
     └─ images...
```

You can train your own model using this same structure. I have also attached the formatted dataset to make training easier.

---

## How to Run the Project

1. Download or clone this repository.
2. Open the `.xcodeproj` file in **Xcode**.
3. Press **Run** to launch the macOS app.

The `.mlmodel` file is already included, so the app will work immediately.

---

## Core ML Model

* Dataset taken from Kaggle.
* Converted into Core ML format.
* Trained using Create ML with the folder structure shown above.

You may replace the model with your own by training in Create ML and dropping the new `.mlmodel` file into the Xcode project.

---

## License

MIT License

---

## Author

**Muhammad Haroon**
Email: [mianmharoon72@gmail.com](mailto:mianmharoon72@gmail.com)
LinkedIn: [https://www.linkedin.com/in/mian-haroon](https://www.linkedin.com/in/mian-haroon)

---

## References

* [Kaggle dataset (original notebook used)](https://www.kaggle.com/code/sinatavakoli/bone-fracture-detection/output)
* [CoreML Tools Documentation](https://coremltools.readme.io/)
