<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Submission</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #6c5ce7;
            --secondary: #a29bfe;
            --accent: #fd79a8;
            --dark: #2d3436;
            --light: #f5f6fa;
            --success: #00b894;
            --danger: #d63031;
            --warning: #fdcb6e;
        }
        
        body {
            font-family: 'Mulish', sans-serif;
            background-color: var(--dark);
            color: var(--light);
            background-image: radial-gradient(circle at 10% 20%, rgba(108, 92, 231, 0.1) 0%, rgba(108, 92, 231, 0.05) 90%);
        }
        
        .payment-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 30px;
            animation: fadeIn 0.5s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .payment-header {
            margin-bottom: 30px;
            text-align: center;
        }
        
        .payment-title {
            font-family: 'Oswald', sans-serif;
            color: var(--primary);
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }
        
        .payment-subtitle {
            color: var(--secondary);
            font-size: 1.1rem;
        }
        
        .payment-card {
            background: rgba(45, 52, 54, 0.8);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(108, 92, 231, 0.3);
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }
        
        .payment-card:hover {
            box-shadow: 0 15px 35px rgba(108, 92, 231, 0.2);
            border-color: rgba(108, 92, 231, 0.5);
        }
        
        .form-label {
            color: var(--secondary);
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            font-size: 1rem;
        }
        
        .form-control, .form-select {
            background-color: rgba(108, 92, 231, 0.1);
            border: 2px solid rgba(108, 92, 231, 0.3);
            color: var(--light);
            padding: 12px 15px;
            border-radius: 10px;
            width: 100%;
            margin-bottom: 20px;
            transition: all 0.3s;
        }
        
        .form-control:focus, .form-select:focus {
            background-color: rgba(108, 92, 231, 0.2);
            color: var(--light);
            border-color: var(--accent);
            box-shadow: 0 0 0 0.25rem rgba(253, 121, 168, 0.25);
            outline: none;
        }
        
        .file-upload {
            position: relative;
            margin-bottom: 20px;
        }
        
        .file-upload-input {
            width: 0.1px;
            height: 0.1px;
            opacity: 0;
            overflow: hidden;
            position: absolute;
            z-index: -1;
        }
        
        .file-upload-label {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            border: 2px dashed var(--primary);
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
            background-color: rgba(108, 92, 231, 0.1);
        }
        
        .file-upload-label:hover {
            border-color: var(--accent);
            background-color: rgba(108, 92, 231, 0.2);
            transform: translateY(-2px);
        }
        
        .file-upload-icon {
            margin-right: 10px;
            color: var(--accent);
            font-size: 1.5rem;
        }
        
        .preview-container {
            display: none;
            margin-top: 20px;
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
        }
        
        .preview-image {
            max-width: 100%;
            max-height: 300px;
            border-radius: 10px;
            border: 3px solid var(--primary);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transition: all 0.3s;
        }
        
        .preview-image:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        
        .remove-image {
            color: var(--danger);
            cursor: pointer;
            font-size: 14px;
            display: inline-block;
            margin-top: 15px;
            transition: all 0.3s;
        }
        
        .remove-image:hover {
            color: #ff7675;
            transform: scale(1.05);
        }
        
        .btn-submit {
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            border: none;
            padding: 15px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 50px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 20px;
            color: white;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(108, 92, 231, 0.4);
            text-transform: uppercase;
        }
        
        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(108, 92, 231, 0.6);
            background: linear-gradient(135deg, var(--accent) 0%, var(--primary) 100%);
        }
        
        .confirmation-dialog {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(45, 52, 54, 0.9);
            z-index: 1000;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(5px);
            animation: fadeIn 0.3s ease-in-out;
        }
        
        .confirmation-box {
            background: linear-gradient(135deg, var(--dark) 0%, #1e272e 100%);
            padding: 30px;
            border-radius: 15px;
            width: 90%;
            max-width: 450px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
            text-align: center;
            border: 1px solid var(--primary);
        }
        
        .confirmation-title {
            color: var(--accent);
            font-family: 'Oswald', sans-serif;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }
        
        .confirmation-method {
            background-color: rgba(108, 92, 231, 0.2);
            padding: 10px;
            border-radius: 8px;
            margin: 15px 0;
            border-left: 4px solid var(--primary);
        }
        
        .confirmation-preview {
            max-width: 100%;
            max-height: 200px;
            border-radius: 10px;
            border: 3px solid var(--primary);
            margin: 15px auto;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        
        .confirmation-text {
            color: var(--secondary);
            margin: 20px 0;
            font-size: 1.1rem;
        }
        
        .confirmation-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        
        .btn-confirm {
            padding: 12px 25px;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .btn-yes {
            background: linear-gradient(135deg, var(--success) 0%, #55efc4 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(0, 184, 148, 0.4);
        }
        
        .btn-yes:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 184, 148, 0.6);
        }
        
        .btn-no {
            background: linear-gradient(135deg, var(--danger) 0%, #ff7675 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(214, 48, 49, 0.4);
        }
        
        .btn-no:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(214, 48, 49, 0.6);
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .payment-container {
                padding: 20px;
            }
            
            .payment-title {
                font-size: 2rem;
            }
            
            .confirmation-buttons {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn-confirm {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <div class="payment-header">
            <h1 class="payment-title">Payment Submission</h1>
            <p class="payment-subtitle">Complete your subscription with secure payment</p>
        </div>
        
        <div class="payment-card">
            <form id="paymentForm" action="${pageContext.request.contextPath}/makePayment" method="post" enctype="multipart/form-data">
                <input type="hidden" name="packageId" value="${packageId}" />
                
                <div class="form-group">
                    <label for="method" class="form-label">Payment Method:</label>
                    <select name="paymentMethodId" class="form-select" required>
                        <option value="" disabled selected>Select payment method</option>
                        <option value="1">KPay</option>
                        <option value="2">WavePay</option>
           
                        <option value="3">PayPal</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Payment Screenshot:</label>
                    <div class="file-upload">
                        <input type="file" id="screenshot" name="screenshot" class="file-upload-input" accept="image/*" required>
                        <label for="screenshot" class="file-upload-label">
                            <i class="fas fa-cloud-upload-alt file-upload-icon"></i>
                            <span id="file-name">Choose screenshot file</span>
                        </label>
                    </div>
                </div>

                <!-- Image Preview Container -->
                <div id="previewContainer" class="preview-container">
                    <img id="imagePreview" class="preview-image" src="#" alt="Payment Screenshot Preview">
                    <div class="remove-image" id="removeImage">
                        <i class="fas fa-times"></i> Remove Image
                    </div>
                </div>

                <button type="button" id="submitBtn" class="btn-submit">
                    <i class="fas fa-paper-plane"></i> Submit Payment
                </button>
            </form>
        </div>
    </div>

    <!-- Confirmation Dialog with Preview -->
    <div id="confirmationDialog" class="confirmation-dialog">
        <div class="confirmation-box">
            <h3 class="confirmation-title">Confirm Payment Submission</h3>
            
            <div class="confirmation-method">
                <p style="color: var(--light); margin-bottom: 5px;"><strong>Payment Method:</strong></p>
                <p id="confirmMethod" style="color: var(--accent); font-weight: 600; margin: 0;"></p>
            </div>
            
            <div>
                <p style="color: var(--secondary); margin-bottom: 10px;"><strong>Screenshot Preview:</strong></p>
                <img id="confirmPreview" class="confirmation-preview" src="#" alt="Payment confirmation preview">
            </div>
            
            <p class="confirmation-text">Are you sure you want to submit this payment?</p>
            <div class="confirmation-buttons">
                <button id="confirmYes" class="btn-confirm btn-yes">Yes, Submit</button>
                <button id="confirmNo" class="btn-confirm btn-no">Cancel</button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Display selected file name and preview
        document.getElementById('screenshot').addEventListener('change', function(e) {
            const fileInput = e.target;
            const fileName = fileInput.files[0] ? fileInput.files[0].name : 'Choose screenshot file';
            document.getElementById('file-name').textContent = fileName;
            
            // Show preview if image is selected
            if (fileInput.files && fileInput.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    document.getElementById('imagePreview').src = e.target.result;
                    document.getElementById('previewContainer').style.display = 'block';
                }
                
                reader.readAsDataURL(fileInput.files[0]);
            }
        });

        // Remove image functionality
        document.getElementById('removeImage').addEventListener('click', function() {
            document.getElementById('screenshot').value = '';
            document.getElementById('file-name').textContent = 'Choose screenshot file';
            document.getElementById('previewContainer').style.display = 'none';
        });

        // Confirmation dialog handling with preview
        document.getElementById('submitBtn').addEventListener('click', function() {
            // First validate the form
            const form = document.getElementById('paymentForm');
            if (!form.checkValidity()) {
                form.reportValidity();
                return;
            }
            
            // Get selected payment method text
            const methodSelect = document.querySelector('select[name="paymentMethodId"]');
            const selectedMethod = methodSelect.options[methodSelect.selectedIndex].text;
            document.getElementById('confirmMethod').textContent = selectedMethod;
            
            // Set preview image in confirmation dialog
            const fileInput = document.getElementById('screenshot');
            if (fileInput.files && fileInput.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    document.getElementById('confirmPreview').src = e.target.result;
                }
                
                reader.readAsDataURL(fileInput.files[0]);
            }
            
            // Show confirmation dialog
            document.getElementById('confirmationDialog').style.display = 'flex';
        });

        document.getElementById('confirmYes').addEventListener('click', function() {
            document.getElementById('paymentForm').submit();
        });

        document.getElementById('confirmNo').addEventListener('click', function() {
            document.getElementById('confirmationDialog').style.display = 'none';
        });

        // Add animation to confirmation buttons
        const buttons = document.querySelectorAll('.btn-confirm');
        buttons.forEach(button => {
            button.addEventListener('mouseenter', () => {
                button.style.transform = 'translateY(-3px)';
            });
            button.addEventListener('mouseleave', () => {
                button.style.transform = 'translateY(0)';
            });
        });
    </script>
</body>
</html>