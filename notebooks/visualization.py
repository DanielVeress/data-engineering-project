import numpy as np
from matplotlib import pyplot as plt

def plot_scalability_tests(duration_data:dict, x_label:str = 'Test Number', x_indices:list = None):
    """Plots scalability tests running time"""
    title = duration_data['title']
    durations = duration_data['tests']
    
    # Create indices for x-axis (test number)
    if x_indices is None:
        test_indices = np.arange(1, len(durations) + 1)
    else:
        test_indices = np.array(x_indices)
    
    fig, ax = plt.subplots(figsize=(10, 6))
    ax.plot(test_indices, durations, linestyle='dashed', marker='o', color='blue', alpha=0.7)
    
    # Set labels and title
    ax.set_xlabel(x_label)
    ax.set_ylabel('Duration (seconds)')
    ax.set_title(f'Test Durations for {title}')
    
    # Customize x-axis
    ax.set_xticks(test_indices)
    
    # Add annotations with actual duration values
    for i, duration in enumerate(durations):
        minutes = int(duration // 60)
        seconds = int(duration % 60)
        formatted_time = f"{minutes}:{seconds:02d}"
        
        ax.annotate(f"{formatted_time}", 
                   (test_indices[i], durations[i]),
                   textcoords="offset points", 
                   xytext=(0,10), 
                   ha='center')
    
    plt.tight_layout()
    return fig