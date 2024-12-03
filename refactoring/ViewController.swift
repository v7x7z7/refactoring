import UIKit

final class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let pickerData = ["Раздел 1", "Раздел 2", "Раздел 3"]
    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Поделиться", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupPickerView()
        setupShareButton()
        setupConstraints()
    }
    
    private func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
    }
    
    private func setupShareButton() {
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        view.addSubview(shareButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Констрейнты для UIPickerView
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            pickerView.widthAnchor.constraint(equalToConstant: 300),
            pickerView.heightAnchor.constraint(equalToConstant: 150),
            
            // Констрейнты для UIButton
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20),
            shareButton.widthAnchor.constraint(equalToConstant: 150),
            shareButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func shareButtonTapped() {
        let items: [Any] = ["Раздел поделиться"]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // 1 столбец
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 { // Если выбран третий раздел
            let items: [Any] = ["Выбран Раздел 3 "]
            let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(activityVC, animated: true, completion: nil)
        }
    }
}
